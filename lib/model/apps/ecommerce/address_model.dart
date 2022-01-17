class AddressModel {
  late int id;
  late String title;
  late String recipientName;
  late String phoneNumber;
  late String addressLine1;
  late String addressLine2;
  late String state;
  late String postalCode;
  late bool defaultAddress;

  AddressModel({required this.id, required this.title, required this.recipientName, required this.phoneNumber, required this.addressLine1, required this.addressLine2, required this.state, required this.postalCode, required this.defaultAddress});
}

List<AddressModel> addressData = [
  AddressModel(
      id: 1,
      title: 'Home Address',
      recipientName: 'Robert Steven',
      phoneNumber: '0811888999',
      addressLine1: '6019 Madison St',
      addressLine2: 'West New York, NJ',
      state: 'USA',
      postalCode: '07093',
      defaultAddress: true
  ),
  AddressModel(
      id: 2,
      title: 'Apartment Address',
      recipientName: 'Robert Steven',
      phoneNumber: '0811888999',
      addressLine1: 'Meridia Park Avenue Apartments',
      addressLine2: '6035 Park Ave, West New York, NJ',
      state: 'USA',
      postalCode: '07093',
      defaultAddress: false
  ),
  AddressModel(
      id: 3,
      title: 'Office Address',
      recipientName: 'Robert Steven',
      phoneNumber: '0811888999',
      addressLine1: '6015 Van Buren Pl',
      addressLine2: 'West New York, NJ',
      state: 'USA',
      postalCode: '07093',
      defaultAddress: false
  ),
  AddressModel(
      id: 4,
      title: 'Mom Address',
      recipientName: 'Stephanie',
      phoneNumber: '0811564855',
      addressLine1: '7503 2nd Ave',
      addressLine2: 'North Bergen, NJ',
      state: 'USA',
      postalCode: '07047',
      defaultAddress: false
  ),
  AddressModel(
      id: 5,
      title: 'Anthony Address',
      recipientName: 'Anthony Daniel',
      phoneNumber: '0811118997',
      addressLine1: '223-201 62nd St',
      addressLine2: 'West New York, NJ',
      state: 'USA',
      postalCode: '07093',
      defaultAddress: false
  ),
];