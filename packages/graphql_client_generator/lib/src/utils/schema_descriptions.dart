List<String> commentsFromDescription(String description) {
  if (description == null) {
    return <String>[];
  }
  return description.split("\n").map((c) => "/// $c").toList();
}
