VirtualHost "{{jitsi_domain}}"
    authentication = "anonymous"
    ssl = {
        key = "/var/lib/prosody/{{jitsi_domain}}.key";
        certificate = "/var/lib/prosody/{{jitsi_domain}}.crt";
    }
    modules_enabled = {
        "bosh";
        "pubsub";
        "ping";
    }

VirtualHost "{{jitsi_auth_domain}}"
    authentication = "internal_plain"

admins = { "{{jitsi_jicofo_user}}@{{jitsi_auth_domain}}" }

Component "{{jitsi_conference_domain}}" "muc"
Component "{{jitsi_videobridge_domain}}"
    component_secret = "{{jitsi_videobridge_component_secret}}"
Component "{{jitsi_focus_domain}}"
    component_secret = "{{jitsi_jicofo_component_secret}}"
