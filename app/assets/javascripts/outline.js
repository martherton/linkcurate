<!--
                            function hover(iNode, over) {
                            
                            if (over) {
                            t = document.getElementById(iNode).alt;
                            
                            if (t == '*') {
                            document.getElementById(iNode).className='handle-image';
                            } else if (t == 'V') {
                            document.getElementById(iNode).className='collapse-image';
                            } else {
                            document.getElementById(iNode).className='expand-image';
                            }
                            } else {
                            document.getElementById(iNode).className='blank-image';
                            }
                            }
                            
                            function expand(ioNode) {
                            ioWedge = "i" + ioNode.substr(1);
                            
                            if (document.getElementById && document.getElementById(ioNode) !=  null) {
                            
                            document.getElementById(ioNode).className='expanded';
                            
                            if (document.getElementById(ioWedge) !=  null) {
                            theme = document.getElementById(ioWedge).className;
                            if (theme == "expand-image-light-theme") {
                            document.getElementById(ioWedge).className='collapse-image-light-theme';
                            document.getElementById(ioWedge).title='collapse';
                            document.getElementById(ioWedge).alt='V';
                            } else if (theme == "expand-image-dark-theme") {
                            document.getElementById(ioWedge).className='collapse-image-dark-theme';
                            document.getElementById(ioWedge).title='collapse';
                            document.getElementById(ioWedge).alt='V';
                            }
                            }
                            }
                            }
                            
                            function collapse(ioNode) {
                            ioWedge = "i" + ioNode.substr(1);
                            
                            if (document.getElementById && document.getElementById(ioNode) != null) {
                            
                            document.getElementById(ioNode).className='collapsed';
                            
                            if (document.getElementById(ioWedge) !=  null) {   
                            theme = document.getElementById(ioWedge).className; 
                            if (theme == "collapse-image-light-theme") {    
                            document.getElementById(ioWedge).className='expand-image-light-theme';
                            document.getElementById(ioWedge).title='expand';
                            document.getElementById(ioWedge).alt='>';
                            } else if (theme == "collapse-image-dark-theme") {
                            document.getElementById(ioWedge).className='expand-image-dark-theme';
                            document.getElementById(ioWedge).title='collapse';
                            document.getElementById(ioWedge).alt='V';
                            }
                            }
                            }
                            }
                            
                            function ioSwitch(ioNode,fully) {
                            
                            if (document.getElementById && document.getElementById(ioNode) !=  null) {
                            nodeState = document.getElementById(ioNode).className;
                            }
                            
                            if (nodeState == 'collapsed') {
                            if (fully) {
                            expandAll();
                            } else {
                            expand(ioNode);
                            }
                            }
                            
                            else {
                            if (fully) {
                            collapseAll();
                            } else {
                            collapse(ioNode);
                            }
                            }
                            updateRowBackgroundColors();
                            }
                            
                            function expandAll() {
                            
                            if (document.getElementsByTagName) {
                            nodeList = document.getElementsByTagName('div');
                            
                            for (var i = 0; i < nodeList.length; i++) {
                            
                            if (nodeList.item(i).className == 'expanded' || nodeList.item(i).className == 'collapsed') {
                            expand(nodeList.item(i).id);
                            }
                            }
                            }
                            
                            else {
                            alert ("Sorry, don't know how to make this run in your browser.");
                            }
                            }
                            
                            function collapseAll() {
                            
                            if (document.getElementsByTagName) {
                            nodeList = document.getElementsByTagName('div');
                            
                            for (var i = 0; i < nodeList.length; i++) {
                            
                            if (nodeList.item(i).className == 'expanded' || nodeList.item(i).className == 'collapsed') {
                            collapse(nodeList.item(i).id);
                            }
                            }
                            }
                            
                            else {
                            alert ("Sorry, don't know how to make this run in your browser.");
                            }
                            }
                            
                            function hasClass(ele,cls) {
                            return ele.className.match(new RegExp('(\\s|^)'+cls+'(\\s|$)'));
                            }
                            function addClass(ele,cls) {
                            if (!this.hasClass(ele,cls)) ele.className += " "+cls;
                            }
                            function removeClass(ele,cls) {
                            if (hasClass(ele,cls)) {
                            var reg = new RegExp('(\\s|^)'+cls+'(\\s|$)');
                            ele.className=ele.className.replace(reg,' ');
                            }
                            }
                            
                            function isVisible(obj)
                            {
                            if (obj == document)
                            return true;
                            
                            if (!obj)
                            return false;
                            if (!obj.parentNode)
                            return false;
                            if (obj.style) {
                            if (obj.style.display == 'none')
                            return false;
                            if (obj.style.visibility == 'hidden')
                            return false;
                            }
                            
                            //Try the computed style in a standard way
                            if (window.getComputedStyle) {
                            var style = window.getComputedStyle(obj, "");
                            if (style.display == 'none')
                            return false;
                            if (style.visibility == 'hidden')
                            return false;
                            }
                            
                            //Or get the computed style using IE's silly proprietary way
                            var style = obj.currentStyle
                            if (style) {
                            if (style['display'] == 'none')
                            return false;
                            if (style['visibility'] == 'hidden')
                            return false;
                            }
                            return isVisible(obj.parentNode);
                            }
                            
                            function updateRowBackgroundColors() {
                            // do not update row colors unless alternate row colors has been specified.
                            if (!hasClass(document.body, 'altRowColors'))
                            return;
                            var possibleRows = document.getElementsByClassName("row");
                            var rowCount = 0;
                            for(var i = 0; i < possibleRows.length; i++) {
                            var element = possibleRows[i];
                            // var topicRow = document.getElementById('rt' + element.id.substr(1));
                            if (isVisible(element)) {
                            rowCount++;
                            if (rowCount % 2 == 0) {
                            addClass(element, 'altRow');
                            // addClass(topicRow, 'altRow');
                            } else {
                            removeClass(element, 'altRow');
                            // removeClass(element, 'altRow');
                            }
                            }
                            }
                            }
                            
                            function mouseMoved() {
                            fadeInHUD();
                            document.body.onmousemove = '';
                            setTimeout('fadeOutHUD();', 1000);
                            }
                            
                            function fadeInHUD() {
                            document.getElementById("floating-palette").style.opacity = 0.8;
                            }
                            
                            function fadeOutHUD() {
                            document.getElementById("floating-palette").style.opacity = 0;
                            }
                            
                            window.onload = updateRowBackgroundColors;
                            -->