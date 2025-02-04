#!/bin/bash

set -e

for f in G1F7-14C368-AA G1F7-14C366-AL G1F7-14C367-AL HP57-14C366-AG HP57-14C367-AG \
	    F1FT-14C107-AA F1FT-14C104-AN F1FT-14C105-AH; do
  if ! [[ -f "$f.vbf" ]] ; then
    for rawfile in $f $f.zip; do
      set -x
      curl 'https://www.fordtechservice.dealerconnection.com/vdirs/wds/PCMReprogram/DSFM_DownloadFile.asp' --data-raw "filename=$rawfile" --output $f.zip > /dev/null
      if unzip -t $f.zip >& /dev/null; then
        break
      fi
    rm $f.zip
    done
    if ! [[ -f "$f.zip" ]]; then
      rm -f $f.zip
      echo $f.zip is corrupted
      exit 1
    fi
    unzip $f.zip
    rm $f.zip
  fi
done

bspatch ./G1F7-14C366-AL.vbf ./G1F7-14C366-AL-DAFT-T5.vbf ./G1F7-14C366-AL-DAFT-T5.vbf.diff
bspatch ./G1F7-14C366-AL.vbf ./G1F7-14C366-AL-DAFT-T11.vbf ./G1F7-14C366-AL-DAFT-T11.vbf.diff
bspatch ./G1F7-14C366-AL.vbf ./G1F7-14C366-AL-DAFT-T13.vbf ./G1F7-14C366-AL-DAFT-T13.vbf.diff
bspatch ./G1F7-14C366-AL.vbf ./G1F7-14C366-AL-DAFT-T14.vbf ./G1F7-14C366-AL-DAFT-T14.vbf.diff
bspatch ./G1F7-14C366-AL.vbf ./G1F7-14C366-AL-DAFT-T15.vbf ./G1F7-14C366-AL-DAFT-T15.vbf.diff
bspatch ./G1F7-14C366-AL.vbf ./G1F7-14C366-AL-DAFT-T16.vbf ./G1F7-14C366-AL-DAFT-T16.vbf.diff
bspatch ./G1F7-14C366-AL.vbf ./G1F7-14C366-AL-DAFT-T18.vbf ./G1F7-14C366-AL-DAFT-T18.vbf.diff
bspatch ./G1F7-14C366-AL.vbf ./G1F7-14C366-AL-DAFT-X1.vbf ./G1F7-14C366-AL-DAFT-X1.vbf.diff

bspatch ./G1F7-14C367-AL.vbf ./G1F7-14C367-AL-DAFT-DS1.vbf ./G1F7-14C367-AL-DAFT-DS1.vbf.diff
bspatch ./G1F7-14C367-AL.vbf ./G1F7-14C367-AL-DAFT-DS3.vbf ./G1F7-14C367-AL-DAFT-DS3.vbf.diff

bspatch ./HP57-14C366-AG.vbf ./HP57-14C366-AG-DAFT-T1.vbf ./HP57-14C366-AG-DAFT-T1.vbf.diff

bspatch ./F1FT-14C104-AN.vbf ./F1FT-14C104-AN-RSPROT.vbf ./F1FT-14C104-AN-RSPROT.vbf.diff
