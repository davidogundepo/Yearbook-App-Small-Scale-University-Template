package com.icdatinnovations.small_scale_university
import android.content.Context
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import io.flutter.embedding.android.SplashScreen

class SplashView : SplashScreen {

    private val nullParent: ViewGroup? = null

    override fun createSplashView(context: Context, savedInstanceState: Bundle?): View? =
            LayoutInflater.from(context).inflate(R.layout.splash_view, nullParent, false)

    override fun transitionToFlutter(onTransitionComplete: Runnable) {
        onTransitionComplete.run()
    }
}