#ifndef MAINACTIVITY_JNI_H
#define MAINACTIVITY_JNI_H

#include <jni.h>

extern "C"
{
  JNIEXPORT void JNICALL
  Java_org_koreatech_trizcartoon_MainActivity_resume(JNIEnv *env, jobject obj);

  JNIEXPORT void JNICALL
  Java_org_koreatech_trizcartoon_MainActivity_pause(JNIEnv *env, jobject obj);

//  JNIEXPORT void JNICALL
//  Java_com_rena_focustimer_MainActivity_backPressed(JNIEnv *env, jobject obj);

//  JNIEXPORT void JNICALL
//  Java_com_rena_focustimer_MainActivity_updateUser(JNIEnv *env, jobject obj,
//                                               jstring media, jstring userKey, jstring userName, jstring userProfileImage);

//  JNIEXPORT void JNICALL
//  Java_com_rena_focustimer_MainActivity_loginMediaFinished(JNIEnv *env, jobject obj,
//                                                  jboolean isSuccess);
//  JNIEXPORT void JNICALL
//  Java_com_rena_focustimer_MainActivity_logoutMediaFinished(JNIEnv *env, jobject obj,
//                                                  jboolean isSuccess);

//  JNIEXPORT void JNICALL
//  Java_com_rena_focustimer_MainActivity_gcmReceivedNotice(JNIEnv *env, jobject obj, jint type, jstring msg);

//	JNIEXPORT void JNICALL
//    Java_com_rena_focustimer_MainActivity_openUrlFinished(JNIEnv *env, jobject obj, jboolean isSuccess);
}


#endif // MAINACTIVITY_JNI_H

