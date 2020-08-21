ad_library {
    Automated tests for the dotlrn-xowiki package.

    @author Héctor Romojaro <hector.romojaro@gmail.com>
    @creation-date 2020-08-21
    @cvs-id $Id$
}

aa_register_case -procs {
        "xowiki_applet proc applet_key"
        "xowiki_applet proc my_package_key"
        "xowiki_applet proc package_key"
        "xowiki_applet proc node_name"
        "xowiki_applet proc pretty_name"
    } -cats {
        api
        production_safe
    } dotlrn_xowiki_names_keys {
        Test diverse *_key and *_name procs.
} {
    aa_equals "Applet key"      "[xowiki_applet applet_key]"        "dotlrn_xowiki"
    aa_equals "My package key"  "[xowiki_applet my_package_key]"    "dotlrn-xowiki"
    aa_equals "Package key"     "[xowiki_applet package_key]"       "xowiki"
    aa_equals "Node name"       "[xowiki_applet node_name]"         "xowiki"
    aa_equals "Pretty name"     "[xowiki_applet pretty_name]"       "XoWiki"
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
