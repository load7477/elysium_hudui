window.addEventListener('message', function (event) {
    var nui = event.data;
    if (nui.action == 'into') {
        moneys = nui.money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        var money = document.querySelector('#money').innerHTML = `${moneys}`
        banks = nui.bank.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        var bank = document.querySelector('#bank').innerHTML = `${banks}`
        var user_id = document.querySelector('#userid').innerHTML = `${nui.name}(${nui.user_id})`
        var job = document.querySelector('#job').innerHTML = `${nui.job}`

    }

    if (nui.action =='z') {
        if (document.querySelector('#banks').style.display == 'block') {
            document.querySelector('#banks').style.display = 'none'
        }  else if (document.querySelector('#banks').style.display == 'none') {
            document.querySelector('#banks').style.display = 'block'
        }
    }
    

    if (nui.action == 'n') {
        document.querySelector('.notify').style.display = 'block'
        function dp() {
            document.querySelector('.notify').style.display = 'none'
        }
        var timeoutId = setTimeout(dp, 5000)
        var title = document.querySelector('.title').innerHTML = `${nui.title}`
        var sub = document.querySelector('.sub').innerHTML = `${nui.sub}`
    }
});

window.addEventListener("keydown", e => {
    console.log(e.key)
    if (e.key == 'z') {
        document.querySelector('#banks').style.display = 'block'
    }    
});
