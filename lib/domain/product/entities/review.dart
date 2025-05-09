class ReviewEntity {
  final int? id;
  final String? modifiedAt;
  final String? createdAt;
  final String? firstName;
  final String? lastName;
  final int? rating;
  final String? message;
  final String? image;

  ReviewEntity({required this.id, required this.modifiedAt, required this.createdAt, required this.firstName, required this.lastName, required this.rating, required this.message, required this.image});
}