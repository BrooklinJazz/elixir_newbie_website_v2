let Hooks = {
    AudioPlayer: {
        hh_mm_ss(seconds) {
            const hour = 3600
            if (seconds >= hour) {
                return new Date(seconds * 1000).toISOString().slice(11, 19);
            } else {
                return new Date(seconds * 1000).toISOString().slice(14, 19);
            }
        },
        mounted() {
            this.seconds = 0

            this.el.addEventListener("timeupdate", (event) => {
                const player_time = document.getElementById("player-current-time")
                const seconds = Math.floor(this.el.currentTime)
                player_time.innerHTML = `${this.hh_mm_ss(seconds)}`

                // update progress bar
                const percent = this.el.currentTime / this.el.duration
                const player_progress_fill = document.getElementById("player-progress-fill")
                player_progress_fill.style.width = `${percent * 100}%`
            })

            this.handleEvent("play", () => { this.el.play() })
            this.handleEvent("pause", () => { this.el.pause() })
            this.handleEvent("forward", () => { this.el.currentTime += 15 })
            this.handleEvent("backward", () => { this.el.currentTime -= 15 })
            this.handleEvent("toggle-mute", () => { this.el.muted = !this.el.muted })
            this.handleEvent("set-volume", ({ volume }) => { this.el.volume = volume })
            this.handleEvent("set-speed", ({ value }) => { this.el.playbackRate = value })
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
            window.addEventListener("mousedown", () => { this.mouseDown = true });
            window.addEventListener("mouseup", () => { this.mouseDown = false })
            this.el.addEventListener("mousemove", (e) => { this.mouseDown && this.setProgress(e) })
            this.el.addEventListener("click", (e) => { this.setProgress(e) })
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