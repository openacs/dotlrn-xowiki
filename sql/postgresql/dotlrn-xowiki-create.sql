
-- create the implementation
select acs_sc_impl__new (
        'dotlrn_applet',
        'dotlrn_xowiki',
        'dotlrn_xowiki'
);

-- add all the hooks

-- GetPrettyName
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_xowiki',
           'GetPrettyName',
           'xowiki::get_pretty_name',
           'TCL'
);

-- AddApplet
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_xowiki',
           'AddApplet',
           'xowiki::add_applet',
           'TCL'
);

-- RemoveApplet
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_xowiki',
           'RemoveApplet',
           'xowiki::remove_applet',
           'TCL'
);

-- AddAppletToCommunity
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_xowiki',
           'AddAppletToCommunity',
           'xowiki::add_applet_to_community',
           'TCL'
);

-- RemoveAppletFromCommunity
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_xowiki',
           'RemoveAppletFromCommunity',
           'xowiki::remove_applet_from_community',
           'TCL'
);

-- AddUser
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_xowiki',
           'AddUser',
           'xowiki::add_user',
           'TCL'
);

-- RemoveUser
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_xowiki',
           'RemoveUser',
           'xowiki::remove_user',
           'TCL'
);

-- AddUserToCommunity
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_xowiki',
           'AddUserToCommunity',
           'xowiki::add_user_to_community',
           'TCL'
);

-- RemoveUserFromCommunity
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_xowiki',
           'RemoveUserFromCommunity',
           'xowiki::remove_user_from_community',
           'TCL'
);

-- AddPortlet
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_xowiki',
        'AddPortlet',
        'xowiki::add_portlet',
        'TCL'
    );

-- RemovePortlet
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_xowiki',
        'RemovePortlet',
        'xowiki::remove_portlet',
        'TCL'
);

-- Clone
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_xowiki',
        'Clone',
        'xowiki::clone',
        'TCL'
);

select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_xowiki',
        'ChangeEventHandler',
        'xowiki::change_event_handler',
        'TCL'
);

-- Add the binding
select acs_sc_binding__new (
        'dotlrn_applet',
        'dotlrn_xowiki'
);
