// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0

import QtQuick 6.3
import QtQuick.Window 6.3
import ToDoList

Window {
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "ToDoList"

    Screen01 {
        id: mainScreen
    }

}

