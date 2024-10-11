// Column(
//               children: [
//                 SliderTheme(
//                   data: SliderTheme.of(context).copyWith(
//                     thumbShape:
//                         const RoundSliderThumbShape(enabledThumbRadius: 0),
//                   ),
//                   child: Slider(
//                     activeColor: Colors.blue,
//                     min: 0,
//                     max: value.totalDuration.inSeconds.toDouble(),
//                     value: value.currentDuration.inSeconds.toDouble(),
//                     onChanged: (double currentPosition) {
//                       value.seek(Duration(seconds: currentPosition.toInt()));
//                     },
//                     onChangeEnd: (double currentPosition) {
//                       value.seek(Duration(seconds: currentPosition.toInt()));
//                     },
//                   ),
//                 ),
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       "0:00",
//                       style: Theme.of(context).textTheme.smallHeadings,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.7,
//                     ),
//                     Text(
//                       "0:00",
//                       style: Theme.of(context).textTheme.smallHeadings,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Expanded(
//                   child: NeuBox(
//                     height: 50.0,
//                     width: 80.0,
//                     child: IconButton(
//                       icon: const Icon(Icons.skip_previous),
//                       onPressed: () =>
//                           Provider.of<SongsProvider>(context, listen: false)
//                               .playPreviousSong(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20.0,
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: NeuBox(
//                     height: 50.0,
//                     width: 80.0,
//                     child: IconButton(
//                       icon: Icon(
//                           value.isPlaying ? Icons.pause : Icons.play_arrow),
//                       onPressed: () =>
//                           Provider.of<SongsProvider>(context, listen: false)
//                               .pauseOrResume(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20.0,
//                 ),
//                 Expanded(
//                   child: NeuBox(
//                     height: 50.0,
//                     width: 80.0,
//                     child: IconButton(
//                       icon: const Icon(Icons.skip_next),
//                       onPressed: () =>
//                           Provider.of<SongsProvider>(context, listen: false)
//                               .playNextSong(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),