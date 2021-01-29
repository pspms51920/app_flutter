class PadConfigEntity {
	int id;
	PadConfigBody body;
	String key;

	PadConfigEntity({this.id, this.body, this.key});

	PadConfigEntity.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		body = json['body'] != null ? new PadConfigBody.fromJson(json['body']) : null;
		key = json['key'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		if (this.body != null) {
      data['body'] = this.body.toJson();
    }
		data['key'] = this.key;
		return data;
	}
}

class PadConfigBody {
	String apkUrl;
	String welcomeVideoUrl;

	PadConfigBody({this.apkUrl, this.welcomeVideoUrl});

	PadConfigBody.fromJson(Map<String, dynamic> json) {
		apkUrl = json['apkUrl'];
		welcomeVideoUrl = json['welcomeVideoUrl'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['apkUrl'] = this.apkUrl;
		data['welcomeVideoUrl'] = this.welcomeVideoUrl;
		return data;
	}
}
