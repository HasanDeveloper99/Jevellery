class SuppliersData {
  final String name;
  final String mobileNumber;
  final String village;
  // final String gender;

  SuppliersData({
    required this.name,
    required this.mobileNumber,
    required this.village,
    // required this.gender,
  });
}

List<SuppliersData> suppliersDataList = [
  SuppliersData(
    name: "Hasan Abbas",
    mobileNumber: "9313548855",
    village: "Sadikpur",
  ),
  SuppliersData(
    name: "Jakir Ali",
    mobileNumber: "1234567890",
    village: "Sadikpur",
  ),
  SuppliersData(
    name: "Moshin Ali",
    mobileNumber: "9558564640",
    village: "Sadikpur",
  ),
];
