function run() {
    var app = Elm.Atrapos.Main.fullscreen();

    app.ports.levelCompleted.subscribe(function (levelId) {
        var maxLevel = getMaxLevel();
        if (!maxLevel || levelId > maxLevel) {
            localStorage.maxLevel = levelId
        }
    });

    app.ports.getMaxLevel.subscribe(function () {
        var maxLevel = getMaxLevel();

        setTimeout(function () {
            app.ports.maxLevel.send(maxLevel);
        });
    });

    function getMaxLevel() {
        var maxLevelStr = localStorage.maxLevel
        return maxLevelStr ? parseInt(maxLevelStr) : 0;
    }
}
