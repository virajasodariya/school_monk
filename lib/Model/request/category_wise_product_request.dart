class CategoryWiseProductRequest {
  String? clientKey;
  String? deviceType;
  String? userId;
  String? catSlug;
  String? count;
  String? perPage;
  String? page;
  String? filters;

  CategoryWiseProductRequest(
      {this.clientKey,
      this.deviceType,
      this.userId,
      this.catSlug,
      this.count,
      this.perPage,
      this.page,
      this.filters});

  CategoryWiseProductRequest.fromJson(Map<String, dynamic> json) {
    clientKey = json['client_key'];
    deviceType = json['device_type'];
    userId = json['user_id'];
    catSlug = json['cat_slug'];
    count = json['count'];
    perPage = json['per_page'];
    page = json['page'];
    filters = json['filters'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_key'] = this.clientKey;
    data['device_type'] = this.deviceType;
    data['user_id'] = this.userId;
    data['cat_slug'] = this.catSlug;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['page'] = this.page;
    data['filters'] = this.filters;
    return data;
  }
}
