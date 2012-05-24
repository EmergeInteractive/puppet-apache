/*

== Class: apache

Installs apache, ensures a few useful modules are installed (see apache::base),
ensures that the service is running and the logs get rotated.

By including subclasses where distro specific stuff is handled, it ensure that
the apache class behaves the same way on diffrent distributions.

Example usage:

  include apache

*/
class apache ($custom_httpd="") {
  case $::operatingsystem {
    Debian,Ubuntu:  { class{"apache::debian": custom_httpd => $custom_httpd}}
    RedHat,CentOS:  { include apache::redhat}
    default: { fail "Unsupported operatingsystem ${operatingsystem}" }
  }
}
