
ad_library {
    Procs to set up the xowiki applet
}

namespace eval xowiki {
    
    ad_proc -public applet_key {
    } {
        What's my applet key?
    } {
        return "dotlrn_xowiki"
    }

    ad_proc -public my_package_key {
    } {
        What package do I deal with?
    } {
      return "dotlrn-xowiki"
    }

    ad_proc -public package_key {
    } {
        What package do I deal with?
    } {
      return "xowiki"
    }
    
    ad_proc -private node_name {
    } {
      returns the node name
    } {
      return "xowiki"
    }

    ad_proc -public get_pretty_name {
    } {
      returns the pretty name
    } {
       	return "XoWiki"
    }

    ad_proc -public add_applet {
    } {
      One time init - must be repeatable!
    } {
      dotlrn_applet::add_applet_to_dotlrn -applet_key [applet_key] -package_key [my_package_key]
    }

    ad_proc -public remove_applet {
    } {
      One time destroy. 
    } {
      ad_return_complaint 1 "[applet_key] remove_applet not implimented!"
    }
    
    ad_proc -public add_applet_to_community {
      community_id
    } {
      Add the xowiki applet to a specifc dotlrn community
    } {
      # get the community portal id
      set portal_id [dotlrn_community::get_portal_id -community_id $community_id]
      # get applet id
      set applet_id [dotlrn_applet::get_applet_id_from_key -applet_key [applet_key]]

      # create the package instance
      set package_id [dotlrn::instantiate_and_mount $community_id [package_key]]
      # rename the sitenode
      #set node_id [db_string get_data "select node_id from site_nodes where object_id = :package_id" -default 0]

      #if { $node_id != 0 } {
#	site_node::rename -node_id $node_id -name [node_name]
#      }

      # mount an instance of xowiki
      #set xowiki_package_id [dotlrn::instantiate_and_mount $community_id xowiki]

      #site_node::instantiate_and_mount \
#	  -parent_node_id $node(node_id) \
#	  -node_name $instance_name \
#	  -package_name xowiki \
#	  -package_key xowiki

      # set up the admin portlet
      
      set admin_portal_id [dotlrn_community::get_admin_portal_id -community_id $community_id]
      xowiki_admin_portlet::add_self_to_page \
	  -portal_id $admin_portal_id \
	  -package_id $package_id

      # set up the xowiki portlet for this community
      set portal_id [dotlrn_community::get_portal_id -community_id $community_id]


      # 	else {
      # 	  # get the community node id
      # 	  set community_node_id [dotlrn_community::get_community_node_id $community_id]
      # 	  # create the node
      # 	  set node_id [site_node::new -name [node_name] -parent_id $community_node_id]
      # 	  # mount package to community
      # 	  site_node::mount -node_id $node_id -object_id $package_id
      # 	  # set permissions
      # 	  set members_segment_id [dotlrn_community::get_rel_segment_id \
	  # 				      -community_id $community_id \
	  # 				      -rel_type dotlrn_member_rel]
      # 	  permission::grant \
	  # 	      -party_id $members_segment_id \
	  # 	      -object_id $package_id \
	  # 	      -privilege "read"
      # 	}

      # add portlet to community portal
      #set args [ns_set create]
      #ns_set put $args package_id $package_id
      #ns_set put $args param_action "overwrite"
      #add_portlet_helper $portal_id $args
      
      return $package_id
    }

    ad_proc -public remove_applet_from_community {
      community_id
    } {
      remove the applet from the community
    } {
      # get package id
      set package_id [dotlrn_community::get_applet_package_id -community_id $community_id -applet_key [applet_key]]
      set applet_id [dotlrn_applet::get_applet_id_from_key -applet_key [applet_key]]
      dotlrn::unmount_package -package_id $package_id
      set url "[dotlrn_community::get_community_url $community_id][node_name]/"
      # delete site node
      if { [site_node::exists_p -url $url] } {
	# get site node of mounted xowiki instance
	set node_id [site_node::get_node_id -url $url]
	# unmount package
	site_node::unmount -node_id $node_id
	# delete site node
	site_node::delete -node_id $node_id
      }
    }

    ad_proc -public add_user {
	user_id
    } {
	one time user-specifuc init
    } {
        # noop
    }

    ad_proc -public remove_user {
        user_id
    } {
    } {
        ad_return_complaint 1 "[applet_key] remove_user not implimented!"
    }

    ad_proc -public add_user_to_community {
		community_id
		user_id
    } {
		Add a user to a specifc dotlrn community
    } {
#     	set portal_id [dotlrn::get_portal_id -user_id $user_id]
#         set package_id [dotlrn_community::get_applet_package_id -community_id $community_id -applet_key [applet_key]]

#         # use "append" here since we want to aggregate
#         set args [ns_set create]
#         ns_set put $args package_id $package_id
#         ns_set put $args param_action append
#         add_portlet_helper $portal_id $args
#         # flush cache for this portal
#         ::tlf_global flush_portal $portal_id
    }

    ad_proc -public remove_user_from_community {
        community_id
        user_id
    } {
        Remove a user from a community
    } {
#         set package_id [dotlrn_community::get_applet_package_id -community_id $community_id -applet_key [applet_key]]
#         set portal_id [dotlrn::get_portal_id -user_id $user_id]

#         set args [ns_set create]
#         ns_set put $args package_id $package_id

#         remove_portlet $portal_id $args
#         # flush cache for this portal
#         ::tlf_global flush_portal $portal_id
    }
	
    ad_proc -public add_portlet {
        portal_id
    } {
        A helper proc to add the underlying portlet to the given portal. 
        
        @param portal_id
    } {
        # simple, no type specific stuff, just set some dummy values

#         set args [ns_set create]
#         ns_set put $args package_id 0
#         add_portlet_helper $portal_id $args
    }

    ad_proc -public add_portlet_helper {
      portal_id
      args
    } {
      A helper proc to add the underlying portlet to the given portal.
      @param portal_id
    } {
      xowiki_portlet::add_self_to_page \
	  -portal_id $portal_id \
	  -package_id [ns_set get $args "package_id"] \
	  -param_action [ns_set get $args "param_action"]
     }
    
    ad_proc -public remove_portlet {
        portal_id
        args
    } {
        A helper proc to remove the underlying portlet from the given portal. 
        
        @param portal_id
        @param args A list of key-value pairs (possibly user_id, community_id, and more)
    } { 
#     	xowiki_portlet::remove_self_from_page \
#             -portal_id $portal_id \
#             -package_id [ns_set get $args "package_id"] 
    }

    ad_proc -public clone {
        old_community_id
        new_community_id
    } {
        Clone this applet's content from the old community to the new one
    } {
        ns_log notice "Cloning: [applet_key]"
        set new_package_id [add_applet_to_community $new_community_id]
        set old_package_id [dotlrn_community::get_applet_package_id \
            -community_id $old_community_id \
            -applet_key [applet_key]
        ]

        db_exec_plsql clone_data {}
        return $new_package_id
    }

    ad_proc -public change_event_handler {
        community_id
        event
        old_value
        new_value
    } { 
        listens for the following events: 
    } { 
    }   

}
