#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY!��  ���0 @}������~����P�P�X30Up�)��  �  4    "b��)�� 	�M4сd1���$�ɉS�@��x��=OCSFG�d=OD�F� �A�&������F�FL�a �D�I�i꟡��OS'�)�䞐4z��������$ 	�6D��]6:��P"f�_��I�!������ƀ�""�+s�.�us��f���`{itG�4�;"+`�i|�E��*��D�+*�
��o�\?9i�濟����Uy�=��P��WZFɍ�KB�;�j胙$���ϥ��S�R��l"�jl�##�<��_��W�8J��Ia-[��M�δ��x��s.%�7����2�P�U���f������p��]�z6X�����M�����C�b˟�H@�*���E{+J��S_kR�fp�y�cq�j:��c��D 9�q��V����l�u|ٯ�/ж�0��lM'��~фw��wIJP�.;���W`�j�5!��"��#�<�����6U��Ѥ�B��	�};C��o��Q���|Y����6�ߞ��y
�*���ɏ$rt�0_��Ĥ�nJ��U}�..58�$���N����п��j������#5�3:��}y��y.y�I�w-e>
d�$$�2�'���� ����_�ݚ)��N��"�ʸL��L�:Ue�[2E)�V��BMXHH��P��J�m.)�k	HM�&�k%��	���e�*y�%���v���0�>;��a��Wj�����ކL
��n�!C,��/��ĪISc��V�.<%N��XYL𙴙6�+��WG��+���(��:J$o�Meq�N�n��/{5���tv"���m.;���1*�eQW�����b�Ч&�L�㈆豵����t��TL������E���,&2�tj����e�e��6�E>X�V�<�	�1X���%�E@9�Y��cV�����+mfݽ�1q�]]`g���P9�+�]��B@��3`