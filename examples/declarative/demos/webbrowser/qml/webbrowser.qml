/****************************************************************************
**
** Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the QtDeclarative module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** GNU Lesser General Public License Usage
** This file may be used under the terms of the GNU Lesser General Public
** License version 2.1 as published by the Free Software Foundation and
** appearing in the file LICENSE.LGPL included in the packaging of this
** file. Please review the following information to ensure the GNU Lesser
** General Public License version 2.1 requirements will be met:
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Nokia gives you certain additional
** rights. These rights are described in the Nokia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU General
** Public License version 3.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of this
** file. Please review the following information to ensure the GNU General
** Public License version 3.0 requirements will be met:
** http://www.gnu.org/copyleft/gpl.html.
**
** Other Usage
** Alternatively, this file may be used in accordance with the terms and
** conditions contained in a signed written agreement between you and Nokia.
**
**
**
**
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.0
import QtWebKit 1.0

import "content"

Rectangle {
    id: webBrowser

    property string urlString : "http://www.nokia.com/"

    width: 800; height: 600
    color: "#343434"

    FlickableWebView {
        id: webView
        url: webBrowser.urlString
        onProgressChanged: header.urlChanged = false
        anchors { top: headerSpace.bottom; left: parent.left; right: parent.right; bottom: parent.bottom }
    }

    Item { id: headerSpace; width: parent.width; height: 62 }

    Header {
        id: header
        editUrl: webBrowser.urlString
        width: headerSpace.width; height: headerSpace.height
    }

    ScrollBar {
        scrollArea: webView; width: 8
        anchors { right: parent.right; top: header.bottom; bottom: parent.bottom }
    }

    ScrollBar {
        scrollArea: webView; height: 8; orientation: Qt.Horizontal
        anchors { right: parent.right; rightMargin: 8; left: parent.left; bottom: parent.bottom }
    }
}