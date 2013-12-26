This is a repository for [Exherbo](http://exherbo.org)-related scripts.  

# mirrors

This is a script for sanitizing
[`mirrors.conf`](http://git.exherbo.org/arbor.git/tree/metadata/mirrors.conf).

It currently checks:
- that URIs are syntacticaly valid
- that they contain a host which can be resolved using DNS
- that mirror entries are non-empty (at least one valid URI)
