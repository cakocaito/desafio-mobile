import 'package:desafio_mobile/screens/videoStream.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'videoData.dart';

final dio = Dio();

class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  List<VideoData> videos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchVideos();
  }

  Future<void> fetchVideos() async {
    try {
      final response = await dio.get('http://localhost:3001/v1/videos/history?limit=10');
      final data = response.data['data'] as List;

      setState(() {
        videos = data.map<VideoData>((item) => VideoData.fromJson(item)).toList();
      });
    } catch (e) {
      print('Error fetching videos: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return ListTile(
                  title: Text(
                    video.locationName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${video.address}, ${video.city}, ${video.state}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoStream(video: video),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}