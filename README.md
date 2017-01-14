Jitsi Meet Ansible Configuration
================================

Sets up a simple Jitsi Meet server with a vanilla configuration.  Uses
letsencrypt for generating SSL certificates.

Usage
~~~~~

1. Check out this repository with submodules.

```
git clone https://github.com/unhangout/jitsi-server.git --recursive
```

2. Create / update the file `vars/secrets.yml` (which should be managed by
   ansible-vault) with the following variables:

 - `main_user_name`: The main user account for provisioning the server. Recommended: "deploy"
 - `main_user_salt`: Random salt for hte user.
 - `ansible_become_pass`: The sudo password for `main_user_name`
 - `admin_email`: Email address responsible for receiving server-generated email
 - `monitoring_server_ip`: IP address for a nagios monitoring server
 - `main_user_authorized_keys`: SSH keys for the main user to authenticate with.
 - `letsencrypt_account_key`: An account key to use with letsencrypt. Generate one with `openssl genrsa 4096`.
 - `jitsi_domain`: The domain name to use for the jitsi meet server.
 - `jitsi_videobridge_component_secret`: A random string (say, 64 chars)
 - `jitsi_jicofo_component_secret`: Another random string
 - `jitsi_jicofo_user_password`: Another random string

3. Map domain names to the server:
 - Main domain name (`jitsi_domain`).
 - Map each of the Subdomains to map as CNAME records to `jitsi_domain` (e.g. `auth.jitsi.example.com`):
   - `auth.`
   - `jitsi-videobridge.`
   - `focus.`
   - `conference.`

4. Once the domain names are all mapped correctly and DNS has propagated, provision the server with:
```
make firstrun
```

5. For subsequent runs:
```
make
```
or to just make the jitsi configuration:
```
make app
```
