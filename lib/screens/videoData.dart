class VideoData {
  final String uri;
  final String fileName;
  final String title;
  final String subtitle;
  final String description;
  final String locationName;
  final String address;
  final String city;
  final String state;

  VideoData({
    required this.uri,
    required this.fileName,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.locationName,
    required this.address,
    required this.city,
    required this.state,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) {
    final locationInfo = json['locationInfo'];
    final addressInfo = locationInfo['address'];

    return VideoData(
      uri: json['uri'],
      fileName: json['fileName'],
      title: json['videoInfo']['title'],
      subtitle: json['videoInfo']['subtitle'],
      description: json['videoInfo']['description'],
      locationName: locationInfo['name'],
      address: addressInfo['address'],
      city: addressInfo['city'],
      state: addressInfo['state'],
    );
  }
}
