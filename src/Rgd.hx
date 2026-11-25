

import js.html.FileReader;
import haxe.Json;
import js.Syntax;
import js.html.Console;
import js.html.Element;
import js.Browser.document;
import js.Browser.window;

class Rgd {
    static function main() {
        window.onload = () -> {

            elem('work').onclick = () -> {
                var project:Project = {
                    author: value(elem('author')),
                    name: value(elem('project')),
                    description: value(elem('desc')),
                    cost: value(elem('cost')),
                    genre: value(elem('genre')),
                    color: value(elem('color')),
                    platforms: [],
                }

                var platforms = document.getElementsByClassName('telem');
                for (element in platforms) {
                    project.platforms.push({
                        platform: element.childNodes[0].textContent,
                        link: element.childNodes[1].textContent
                    });
                }


                setVelue(elem('out'), Json.stringify(project));

                var pic = elem('pic');
                var file  = Syntax.code('{0}.files[0]', pic);
                if (file != null) {
                    var r = new FileReader();
                    r.readAsDataURL(file);
                    r.onload = (e) -> {
                        project.picture = e.target.result.substr(e.target.result.indexOf(',')+1);
                        //project.picture = e.target.result;
                        setVelue(elem('out'), Json.stringify(project));
                    }
                }
            }

            
            elem('addlink').onclick = () -> {
                var table = elem('links');
                var tr = document.createTableRowElement();
                tr.className = 'telem';
                table.appendChild(tr);
                var tdName = document.createElement('td');
                var tdLink = document.createElement('td');
                var tdDel = document.createElement('td');
                tr.appendChild(tdName);
                tr.appendChild(tdLink);
                tr.appendChild(tdDel);
                tdName.textContent = value(elem('platform'));
                tdLink.textContent = value(elem('link'));
                var delBtn = document.createButtonElement();
                delBtn.textContent = 'удалить';
                delBtn.onclick = () -> {
                    table.removeChild(tr);
                } 
                tdDel.appendChild(delBtn);
            }
        }
    }


    static function elem(id:String):Element {
        return document.getElementById(id);
    }
    static function value(element:Element) {
        return Syntax.code('{0}.value', element);
    }
    static function setVelue(element:Element, value:Dynamic) {
        Syntax.code('{0}.value = {1}', element, value);
    }


}


typedef Project = {
    ?author:String,
    ?name:String,
    ?cost:String,
    ?color:String,
    ?genre:String,
    ?platforms:Array<{
        platform:String,
        link:String
    }>,
    ?description:String,
    ?picture:String,
}
