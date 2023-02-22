let Hooks = {
    AudioPlayer: {
        mounted() {
            console.log("MOUNTED")
            this.seconds = 0
            this.el.addEventListener("timeupdate", () => {
                let seconds = Math.floor(this.el.currentTime)
                this.pushEvent("time-update", { seconds: seconds })
            })

            this.handleEvent("play", () => {
                this.el.play()
            })


            this.handleEvent("pause", () => {
                this.el.pause()
            })

            this.handleEvent("forward", () => {
                this.el.currentTime += 15
            })

            this.handleEvent("backward", () => {
                this.el.currentTime -= 15
            })

            this.handleEvent("set-volume", ({ volume }) => {
                console.log(volume)
                this.el.volume = volume
            })

            this.handleEvent("set-speed", ({ value }) => {
                this.el.playbackRate = value
            })
        }
    },
    Progress: {
        setProgress(e) {
            let bcr = this.el.getBoundingClientRect();
            let percent = (e.clientX - bcr.left) / bcr.width
            let seconds = player.duration * percent
            player = document.getElementById("player")
            player.currentTime = seconds
        },
        mounted() {
            this.mouseDown = false
            window.addEventListener("mousedown", () => {
                this.mouseDown = true
            });
            window.addEventListener("mouseup", () => {
                this.mouseDown = false
            })
            this.el.addEventListener("mousemove", (e) => {
                if (this.mouseDown) {
                    this.setProgress(e)
                }
            })
            this.el.addEventListener("click", (e) => {
                this.setProgress(e)
            })
        }
    },
    ScrollToTop: {
        mounted() {
            this.el.addEventListener("click", () => {
                window.scrollTo({ top: 0, behavior: 'smooth' });
            })
        }
    },
    ScrollOnClick: {
        scroll_target() {
        return this.el.dataset.value;
        },
        mounted() {
        this.el.addEventListener("click", () => {
            const element = document.querySelector(`[data-scroll-id=all_blogs]`);
            element.scrollIntoView({ alignToTop: true, behavior: "smooth" });
        });
        },
    },
    ScrollOnSubmit: {
        scroll_target() {
        return this.el.dataset.value;
        },
        mounted() {
        this.el.addEventListener("submit", (e) => {
            e.preventDefault();
            const element = document.querySelector(`[data-scroll-id=all_blogs]`);
            setTimeout(() => {
            element.scrollIntoView({ alignToTop: true, behavior: "smooth" });
            }, 150);
        });
        },
    }      
}

export default Hooks