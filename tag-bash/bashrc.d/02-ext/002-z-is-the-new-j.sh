# z is the new j

# test if _z is already defined to avoid problems on re-source-ing .bashrc
if [ -r ~/repos/github.com/rupa/z/z.sh -a "x$(type -t _z)" != "xfunction" ]; then
  _Z_NO_RESOLVE_SYMLINKS=1
  _Z_OWNER=d
  . ~/repos/github.com/rupa/z/z.sh
fi
