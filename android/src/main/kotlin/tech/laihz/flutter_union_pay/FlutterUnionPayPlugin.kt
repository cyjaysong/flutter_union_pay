package tech.laihz.flutter_union_pay

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.util.Log
import android.widget.Toast
import androidx.annotation.NonNull
import com.unionpay.UPPayAssistEx
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry

/** FlutterUnionPayPlugin */
class FlutterUnionPayPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private  var activity: Activity?  =  null
    private lateinit var activityBinding:ActivityPluginBinding
    private lateinit var context:Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_union_pay")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }



    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

        Log.e("engine","engine888")
        when (call.method) {
            "getPlatformVersion" -> {
                Toast.makeText(activity, "test", Toast.LENGTH_SHORT)
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            }
            "installed" -> {
                Log.e("ctx",activity.toString())
                Toast.makeText(activity, "test", Toast.LENGTH_LONG)
                val installed = UPPayAssistEx.checkWalletInstalled(activity)
                result.success(installed)
            }
            "pay" -> {
                val tn = call.argument<String>("tn")
                val env = call.argument<String>("env")
                val ret = UPPayAssistEx.startPay(activity, null, null, tn, env)
                Log.e("ret", ret.toString())
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
//        Toast.makeText(this,"activity",Toast.LENGTH_SHORT)

        activity = binding.activity

//

    }



    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
//        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
    }

}
