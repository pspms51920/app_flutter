class BannerEntity {
	String csName;
	String csEnd;
	String pageType;
	String createTime;
	String conditionType;
	String updateTime;
	int id;
	int sort;
	String csStart;
	String pagePath;
	String csPath;
	int status;

	BannerEntity({this.csName, this.csEnd, this.pageType, this.createTime, this.conditionType, this.updateTime, this.id, this.sort, this.csStart, this.pagePath, this.csPath, this.status});

	BannerEntity.fromJson(Map<String, dynamic> json) {
		csName = json['csName'];
		csEnd = json['csEnd'];
		pageType = json['pageType'];
		createTime = json['createTime'];
		conditionType = json['conditionType'];
		updateTime = json['updateTime'];
		id = json['id'];
		sort = json['sort'];
		csStart = json['csStart'];
		pagePath = json['pagePath'];
		csPath = json['csPath'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['csName'] = this.csName;
		data['csEnd'] = this.csEnd;
		data['pageType'] = this.pageType;
		data['createTime'] = this.createTime;
		data['conditionType'] = this.conditionType;
		data['updateTime'] = this.updateTime;
		data['id'] = this.id;
		data['sort'] = this.sort;
		data['csStart'] = this.csStart;
		data['pagePath'] = this.pagePath;
		data['csPath'] = this.csPath;
		data['status'] = this.status;
		return data;
	}
}
