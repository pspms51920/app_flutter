class TabTitle {
	String title;
	String iconPath;

	TabTitle(this.title, this.iconPath);

	TabTitle.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		iconPath = json['iconPath'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['iconPath'] = this.iconPath;
		return data;
	}
}

