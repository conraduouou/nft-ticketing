class NFTEventDetails {
  // improve in the future
  NFTEventDetails({
    required this.assetPath,
    required this.eventTitle,
    this.eventDate,
  });

  final String assetPath;
  final String eventTitle;
  final String? eventDate;
}
