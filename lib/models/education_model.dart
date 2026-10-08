class EducationModel {
  final String degree;
  final String institution;
  final String location;
  final String duration;
  final String description;
  final List<String> highlights;

  const EducationModel({
    required this.degree,
    required this.institution,
    required this.location,
    required this.duration,
    required this.description,
    required this.highlights,
  });
}
