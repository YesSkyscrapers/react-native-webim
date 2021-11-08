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


public class Utils {

    private final ReactApplicationContext reactContext;

    public Utils(ReactApplicationContext reactContext) {
        this.reactContext = reactContext;
    }

    public void sendEvent(String eventName, @Nullable WritableMap params) {
        this.reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit(eventName, params);
    }

    public static WritableMap messageToJson(Message msg) {
        final WritableMap map = Arguments.createMap();
        map.putString("id", msg.getClientSideId().toString());
        map.putDouble("time", msg.getTime());
        map.putString("type", msg.getType().toString());
        map.putString("text", msg.getText());
        map.putString("name", msg.getSenderName());
        map.putString("status", msg.getSendStatus().toString());
        map.putString("avatar", msg.getSenderAvatarUrl());
        map.putBoolean("read", msg.isReadByOperator());
        map.putBoolean("canEdit", msg.canBeEdited());
        return map;
    }

    public static WritableMap messagesToJson(@NonNull List<? extends Message> messages) {
        WritableMap response = Arguments.createMap();
        WritableArray jsonMessages = Arguments.createArray();
        for (Message message : messages) {
            jsonMessages.pushMap(messageToJson(message));
        }
        response.putArray("messages", jsonMessages);
        return response;
    }
}
