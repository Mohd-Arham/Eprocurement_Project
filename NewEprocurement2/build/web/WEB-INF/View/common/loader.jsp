<style type="text/css">
    .loading #main {
        opacity: .1
    }
    #spinWrap{
        display:none;
    }
    .spinner {
        height: 100%;
        width: 100%;
        position: fixed;
        z-index: 10;
        background: #ffffff80;
        left: 0;
        right: 0;
        bottom: 0;
    }
    .spinner .spinWrap {
        width: 200px;
        height: 100px;
        position: absolute;
        top: 55%;
        left: 50%;
        margin-left: -100px;
        margin-top: -100px;
    }
    .framed .spinner {
        position: fixed
    }
    .framed .spinner .spinWrap {
        position: fixed;
        top: 50%;
        height: 75px;
        margin-top: -37.5px
    }

    .spinner .loader, .spinner .spinnerImage {
        height: 74px;
        width: 74px;
        position: absolute;
        top: 0;
        left: 50%;
        opacity: 1;
        filter: alpha(opacity=100);
    }
    .spinner .spinnerImage {
        margin: 27px 0 0 -29px;
        background-image: url(resources/test/loader-logo.png);
        background-repeat: no-repeat;
    }

    .spinner .loader {
        margin: 4px 0 0 -50px;
        background-color: transparent;
        -webkit-animation: rotation .7s infinite linear;
        -moz-animation: rotation .7s infinite linear;
        -o-animation: rotation .7s infinite linear;
        animation: rotation .7s infinite linear;
        border-left: 7px solid #7ac746;
        border-right: 7px solid #7ac746;
        border-bottom: 7px solid #e35d11;
        border-top: 7px solid #e96217;
        border-radius: 100%;
    }
    .spinner .loadingMessage {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        -ms-box-sizing: border-box;
        box-sizing: border-box;
        width: 100%;
        margin-top: 125px;
        text-align: center;
        z-index: 100;
        outline: 0
    }
    @-webkit-keyframes rotation {
        from {
            -webkit-transform: rotate(0)
        }
        to {
            -webkit-transform: rotate(359deg)
        }
    }
    @-moz-keyframes rotation {
        from {
            -moz-transform: rotate(0)
        }
        to {
            -moz-transform: rotate(359deg)
        }
    }
    @-o-keyframes rotation {
        from {
            -o-transform: rotate(0)
        }
        to {
            -o-transform: rotate(359deg)
        }
    }
    @keyframes rotation {
        from {
            transform: rotate(0)
        }
        to {
            transform: rotate(359deg)
        }
    }
    @media only screen and (max-width: 768px) {
        .spinner {
            .spinWrap {
                width: 200px;
                height: 100px;
                position: fixed;
                top: 40%;
                left: 50%;
                margin-left: -93px;
                margin-top: -50px; 
            }
        }
    }
</style>

<!--<div id="preloaderSpinner" class="preloader spinner" style="display: none;">
    <div class="spinWrap">
        <p class="spinnerImage"></p>
        <p class="loader"></p>
        <p class="loadingMessage" id="spinnerMessage"></p>
    </div>
</div>-->