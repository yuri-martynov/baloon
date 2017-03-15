function run() {
    var lastLevel = getLevel("lastLevel");
    var app = Elm.Atrapos.Main.fullscreen(lastLevel);

    app.ports.setMaxLevel.subscribe(function (data) {
        var l = getLevel(data.key);
        if (!l || data.level > l) {
            setLevel(data.key, data.level);
        }
    });

    app.ports.setLevel.subscribe(function (data) {
        setLevel(data.key, data.level);
    });

    app.ports.getLevel.subscribe(function (key) {
        var l = getLevel(key);

        setTimeout(function () {
            app.ports.level.send({ key: key, level: l });
        });
    });

    function getLevel(key) {
        var l = localStorage[key];
        return l ? parseInt(l) : 0;
    }

    function setLevel(key, level) {
        localStorage[key] = level;
    }
}
