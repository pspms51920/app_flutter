class UserLoginResultEntity {
	int sourceId;
	int gender;
	String wxOpenId;
	bool newSignUp;
	String updateTime;
	String avatar;
	String token;
	String deviceToken;
	num points;
	String phoneNumber;
	String sourceType;
	String createTime;
	String wxUnionId;
	String name;
	int id;
	String wxDistributionOpenId;

	UserLoginResultEntity({this.sourceId, this.gender, this.wxOpenId, this.newSignUp, this.updateTime, this.avatar, this.token, this.deviceToken, this.points, this.phoneNumber, this.sourceType, this.createTime, this.wxUnionId, this.name, this.id, this.wxDistributionOpenId});

	UserLoginResultEntity.fromJson(Map<String, dynamic> json) {
		sourceId = json['sourceId'];
		gender = json['gender'];
		wxOpenId = json['wxOpenId'];
		newSignUp = json['newSignUp'];
		updateTime = json['updateTime'];
		avatar = json['avatar'];
		token = json['token'];
		deviceToken = json['deviceToken'];
		points = json['points'];
		phoneNumber = json['phoneNumber'];
		sourceType = json['sourceType'];
		createTime = json['createTime'];
		wxUnionId = json['wxUnionId'];
		name = json['name'];
		id = json['id'];
		wxDistributionOpenId = json['wxDistributionOpenId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['sourceId'] = this.sourceId;
		data['gender'] = this.gender;
		data['wxOpenId'] = this.wxOpenId;
		data['newSignUp'] = this.newSignUp;
		data['updateTime'] = this.updateTime;
		data['avatar'] = this.avatar;
		data['token'] = this.token;
		data['deviceToken'] = this.deviceToken;
		data['points'] = this.points;
		data['phoneNumber'] = this.phoneNumber;
		data['sourceType'] = this.sourceType;
		data['createTime'] = this.createTime;
		data['wxUnionId'] = this.wxUnionId;
		data['name'] = this.name;
		data['id'] = this.id;
		data['wxDistributionOpenId'] = this.wxDistributionOpenId;
		return data;
	}
}
