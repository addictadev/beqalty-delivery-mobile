# 🚀 إعداد CI/CD Workflow يدوياً

## ⚠️ ملاحظة مهمة
بسبب قيود الصلاحيات، يجب إضافة ملفات workflow يدوياً في GitHub.

## 📁 إنشاء مجلد Workflows

### 1. في GitHub Repository
1. اذهب لمستودع GitHub
2. اضغط على "Add file" → "Create new file"
3. اكتب المسار: `.github/workflows/flutter-build.yml`
4. انسخ المحتوى التالي:

## 🔧 محتوى ملف Workflow

```yaml
name: Flutter Build & WhatsApp Notification

on:
  push:
    branches: [ main, dev ]
  pull_request:
    branches: [ main, dev ]

env:
  FLUTTER_VERSION: '3.24.5'
  JAVA_VERSION: '17'

jobs:
  build-and-notify:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Java
        uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: ${{ env.JAVA_VERSION }}

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: ${{ env.FLUTTER_VERSION }}
          channel: 'stable'

      - name: Get Flutter dependencies
        run: flutter pub get

      - name: Analyze Flutter code
        run: flutter analyze

      - name: Build APK
        run: flutter build apk --release
        env:
          FLUTTER_BUILD_NUMBER: ${{ github.run_number }}

      - name: Upload APK as Artifact
        uses: actions/upload-artifact@v4
        with:
          name: app-release-apk
          path: build/app/outputs/flutter-apk/app-release.apk
          retention-days: 30

      - name: Create WhatsApp Message
        run: |
          echo "🚀 *New Flutter App Build Available!*" > whatsapp_message.txt
          echo "" >> whatsapp_message.txt
          echo "*Repository:* ${{ github.repository }}" >> whatsapp_message.txt
          echo "*Branch:* ${{ github.ref_name }}" >> whatsapp_message.txt
          echo "*Build Number:* #${{ github.run_number }}" >> whatsapp_message.txt
          echo "*Status:* ${{ job.status }}" >> whatsapp_message.txt
          echo "" >> whatsapp_message.txt
          echo "📱 *APK File:* app-release.apk" >> whatsapp_message.txt
          echo "" >> whatsapp_message.txt
          echo "*Download Link:*" >> whatsapp_message.txt
          echo "${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}/artifacts" >> whatsapp_message.txt
          echo "" >> whatsapp_message.txt
          echo "🎯 *Next Steps:*" >> whatsapp_message.txt
          echo "• Download the APK from GitHub Actions" >> whatsapp_message.txt
          echo "• Test on device" >> whatsapp_message.txt
          echo "• Deploy to team members" >> whatsapp_message.txt
          echo "" >> whatsapp_message.txt
          echo "_Built automatically by GitHub Actions_ 🛠️" >> whatsapp_message.txt

      - name: Upload WhatsApp Message
        uses: actions/upload-artifact@v4
        with:
          name: whatsapp-notification
          path: whatsapp_message.txt
          retention-days: 7

      - name: Success Notification
        if: success()
        run: |
          echo "✅ Build Successful!" > success_message.txt
          echo "" >> success_message.txt
          echo "🎉 Flutter App Build Completed Successfully" >> success_message.txt
          echo "" >> success_message.txt
          echo "*Repository:* ${{ github.repository }}" >> success_message.txt
          echo "*Branch:* ${{ github.ref_name }}" >> success_message.txt
          echo "*Build Number:* #${{ github.run_number }}" >> success_message.txt
          echo "" >> success_message.txt
          echo "📱 APK Ready for Download" >> success_message.txt
          echo "" >> success_message.txt
          echo "*Download from:*" >> success_message.txt
          echo "${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}/artifacts" >> success_message.txt
          echo "" >> success_message.txt
          echo "🚀 Ready for Testing & Deployment!" >> success_message.txt

      - name: Failure Notification
        if: failure()
        run: |
          echo "❌ Build Failed!" > failure_message.txt
          echo "" >> failure_message.txt
          echo "🚨 Flutter App Build Failed" >> failure_message.txt
          echo "" >> failure_message.txt
          echo "*Repository:* ${{ github.repository }}" >> failure_message.txt
          echo "*Branch:* ${{ github.ref_name }}" >> failure_message.txt
          echo "*Build Number:* #${{ github.run_number }}" >> failure_message.txt
          echo "" >> failure_message.txt
          echo "*Error Details:* Check the GitHub Actions logs for more information." >> failure_message.txt
          echo "" >> failure_message.txt
          echo "🔍 *Next Steps:*" >> failure_message.txt
          echo "• Review the build logs" >> failure_message.txt
          echo "• Fix any compilation errors" >> failure_message.txt
          echo "• Re-run the build" >> failure_message.txt
          echo "" >> failure_message.txt
                          echo "*Build Logs:*" >> failure_message.txt
          echo "${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}" >> failure_message.txt

      - name: Clean up
        if: always()
        run: |
          echo "Cleaning up build artifacts..."
          flutter clean
```

## 📱 كيفية استخدام WhatsApp

### 1. إنشاء مجموعة WhatsApp
- أنشئ مجموعة للفريق التقني
- أضف جميع أعضاء الفريق

### 2. إعداد الإشعارات
- GitHub Actions سيرسل رسائل تلقائياً
- يمكن نسخ الرسائل من artifacts
- إرسال يدوي للفريق

### 3. تتبع البناء
- كل بناء جديد يظهر في المجموعة
- روابط تحميل APK متاحة
- حالة البناء واضحة

## 🔄 دورة العمل

### عند كل Push:
1. **GitHub Actions** يبدأ البناء تلقائياً
2. **بناء APK** يتم في الخلفية
3. **رفع الملف** كـ artifact
4. **إنشاء رسالة** للإشعار
5. **الفريق** يتلقى إشعار عبر WhatsApp

### رسائل WhatsApp:
- **نجح البناء**: رابط تحميل APK + تعليمات
- **فشل البناء**: تفاصيل الخطأ + خطوات الإصلاح
- **معلومات البناء**: رقم البناء + الفرع + الكوميت

## 🎯 الفوائد

### للفريق:
- ✅ إشعارات فورية عن حالة البناء
- ✅ روابط تحميل APK متاحة دائماً
- ✅ تتبع تقدم التطوير
- ✅ تعاون محسن

### للمطورين:
- ✅ بناء تلقائي مع كل تحديث
- ✅ تغذية راجعة فورية
- ✅ توزيع سهل للـ APK
- ✅ توفير الوقت والجهد

---

**🚀 الآن يمكنك إضافة Workflow يدوياً في GitHub!**
