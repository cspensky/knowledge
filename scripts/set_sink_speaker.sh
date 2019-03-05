#!/bin/bash

speaker_sink_index=1
#change the default sink
pacmd "set-default-sink ${speaker_sink_index}"

#move all inputs to the new sink
for app in $(pacmd list-sink-inputs | sed -n -e 's/index:[[:space:]]\([[:digit:]]\)/\1/p');
do
pacmd "move-sink-input $app $speaker_sink_index"
done
