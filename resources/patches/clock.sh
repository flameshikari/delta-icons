#!/usr/bin/env bash

sed -i 's|<scale factor="1" />|<scale factor="1" />\n\t<dynamic-clock defaultHour="10" defaultMinute="10" defaultSecond="30" hourLayerIndex="0" minuteLayerIndex="1" secondLayerIndex="2" drawable="clock" />|' app/src/main/assets/appfilter.xml app/src/main/res/xml/appfilter.xml

sed -i 's|<category title="Alts" />|<category title="Alts" />\n\t<item drawable="clock_alt_2" />|' app/src/main/assets/drawable.xml app/src/main/res/xml/drawable.xml

sed -i 's|MinSdk = 21|MinSdk = 26|' build.gradle

mv -v app/src/main/res/drawable-nodpi/clock.png app/src/main/res/drawable-nodpi/clock_alt_2.png

cat << 'EOF' > app/src/main/res/drawable-nodpi/clock.xml
<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@drawable/clock_dynamic_background"/>
    <foreground>
        <layer-list>
            <item>
                <rotate android:drawable="@drawable/clock_dynamic_hour" android:fromDegrees="300.0" android:toDegrees="5300.0" android:pivotX="50.0%" android:pivotY="50.0%"/>
            </item>
            <item>
                <rotate android:drawable="@drawable/clock_dynamic_minute" android:fromDegrees="60.0" android:toDegrees="60060.0" android:pivotX="50.0%" android:pivotY="50.0%"/>
            </item>
            <item>
                <rotate android:drawable="@drawable/clock_dynamic_second" android:fromDegrees="180.0" android:toDegrees="6180.0" android:pivotX="50.0%" android:pivotY="50.0%" android:level="300"/>
            </item>
            <item android:drawable="@drawable/clock_dynamic_top" />
        </layer-list>
    </foreground>
</adaptive-icon>
EOF