package com.app4t2.rnwebim;

import java.util.List;
import android.util.Log;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.modules.core.DeviceEventManagerModule;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableArray;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import ru.webim.android.sdk.Webim;
import ru.webim.android.sdk.WebimSession;
import ru.webim.android.sdk.MessageListener;
import ru.webim.android.sdk.Message;
import ru.webim.android.sdk.MessageTracker;
import ru.webim.android.sdk.WebimLog;

public class WebimMessageListener implements MessageListener {
    private static final int MESSAGES_PER_REQUEST = 25;
    private Utils utils;

    public WebimMessageListener(Utils utils) {
        this.utils = utils;
    }

    @Override
    public void messageAdded(@Nullable Message before, @NonNull Message message) {
        WritableMap msg = Arguments.createMap();
        msg.putMap("msg", Utils.messageToJson(message));
        this.utils.sendEvent("messageAdded", msg);
    }

    @Override
    public void messageRemoved(@NonNull Message message) {
        final WritableMap msg = Arguments.createMap();
        msg.putMap("msg", Utils.messageToJson(message));
        this.utils.sendEvent("messageRemoved", msg);
    }

    @Override
    public void messageChanged(@NonNull Message from, @NonNull Message to) {
        final WritableMap map = Arguments.createMap();
        map.putMap("to", Utils.messageToJson(to));
        map.putMap("from", Utils.messageToJson(from));
        this.utils.sendEvent("messageChanged", map);
    }

    @Override
    public void allMessagesRemoved() {
        final WritableMap map = Arguments.createMap();
        this.utils.sendEvent("allMessagesRemoved", map);
    }


}
