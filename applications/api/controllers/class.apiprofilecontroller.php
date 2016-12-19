<?php

class ApiProfileController extends ProfileController
{
    private static function isEmail($str)
    {
        return filter_var($str, FILTER_VALIDATE_EMAIL);
    }

    /**
     * Retrieve the user to be manipulated. Defaults to current user.
     *
     * @since 2.0.0
     * @access public
     * @param string $UserReference
     * @param string $Username .
     * @param int|string $UserID Unique ID.
     * @param bool $CheckPermissions Whether or not to check user permissions.
     * @return bool Always true.
     * @throws Exception
     * @internal param mixed $User Unique identifier, possibly username or ID.
     */
    public function getUserInfo($UserReference = '', $Username = '', $UserID = '', $CheckPermissions = false) {
        if ($this->_UserInfoRetrieved) {
            return;
        }

        if (!c('Garden.Profile.Public') && !Gdn::session()->isValid()) {
            throw permissionException();
        }

        // If a UserID was provided as a querystring parameter, use it over anything else:
        if ($UserID) {
            $UserReference = $UserID;
            $Username = 'Unknown'; // Fill this with a value so the $UserReference is assumed to be an integer/userid.
        }

        $this->Roles = array();
        if ($UserReference == '') {
            if ($Username) {
                $this->User = $this->UserModel->getByUsername($Username);
            } else {
                $this->User = $this->UserModel->getID(Gdn::session()->UserID);
            }
        } elseif (is_numeric($UserReference) && $Username != '') {
            $this->User = $this->UserModel->getID($UserReference);
        } else if(self::isEmail($UserReference)) {
            $this->User = $this->UserModel->getByEmail($UserReference);
        } else {
            $this->User = $this->UserModel->getByUsername($UserReference);
        }

        $this->fireEvent('UserLoaded');

        if ($this->User === false) {
            throw notFoundException('User');
        } elseif ($this->User->Deleted == 1) {
            redirect('dashboard/home/deleted');
        } else {
            $this->RoleData = $this->UserModel->getRoles($this->User->UserID);
            if ($this->RoleData !== false && $this->RoleData->numRows(DATASET_TYPE_ARRAY) > 0) {
                $this->Roles = array_column($this->RoleData->resultArray(), 'Name');
            }

            // Hide personal info roles
            if (!checkPermission('Garden.PersonalInfo.View')) {
                $this->Roles = array_filter($this->Roles, 'RoleModel::FilterPersonalInfo');
            }

            $this->setData('Profile', $this->User);
            $this->setData('UserRoles', $this->Roles);
            if ($CssClass = val('_CssClass', $this->User)) {
                $this->CssClass .= ' '.$CssClass;
            }
        }

        if ($CheckPermissions && Gdn::session()->UserID != $this->User->UserID) {
            $this->permission(array('Garden.Users.Edit', 'Moderation.Profiles.Edit'), false);
        }

        $this->addSideMenu();
        $this->_UserInfoRetrieved = true;
        return true;
    }
}