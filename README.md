This is a repository for [Exherbo](http://exherbo.org)-related scripts.  

# The scripts
## mirrors

This is a script for sanitizing
[`mirrors.conf`](http://git.exherbo.org/arbor.git/tree/metadata/mirrors.conf).

It currently checks that:
- URIs are syntacticaly valid
- URIs use a scheme which is `HTTP(S)` or `FTP`
- hosts can be resolved using DNS

It outputs a file which only contains such URIs.
Mirrors entries that do not contain any valid host are not output
(and a warning is sent on `stderr`).

# Licensing

This is all distributed under the [ISC license](LICENSE.md), a free, open source
and non-copyleft license, [equivalent to 2-clauses BSD][BSD2] but simpler.

[BSD2]: http://www.openbsd.org/policy.html
