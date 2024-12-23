class UserData{
  String nama;
  int umur;
  String email;
  String alamat;
  int handphone;
  // String kelamin;
  UserData(this.nama, this.umur, this.email, this.alamat, this.handphone);

  Map<String, dynamic> toJson(){
    return{
      "nama": this.nama,
      "umur": this.umur,
      "email": this.email,
      "alamat": this.alamat,
      "handphone": this.handphone
      // "kelamin" : this.kelamin
    };
  }
}