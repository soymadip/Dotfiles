

convert_to_ansi ()
{
  local color_code=$1

  python3 $ZDOTDIR/modules/custom/hex_to_ansi.py $color_code
}
