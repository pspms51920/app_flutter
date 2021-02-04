package com.yoozoo.app_flutter.channel.download;

import java.io.Serializable;

public class DownloadInfo implements Serializable {

    public static final int TYPE_DOWNLOAD_PROCESS = 10;
    public static final int TYPE_DOWNLOAD_COMPLETED = 11;
    public static final int TYPE_DOWNLOAD_FAILED = 12;

    private int type;

    private float process;

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public float getProcess() {
        return process;
    }

    public void setProcess(float process) {
        this.process = process;
    }

    @Override
    public String toString() {
        return "DownloadInfo{" +
                "type=" + type +
                ", process=" + process +
                '}';
    }
}
