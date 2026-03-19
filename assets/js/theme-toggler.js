$(function () {
    const getStoredTheme = () => localStorage.getItem('theme');
    const setStoredTheme = theme => localStorage.setItem('theme', theme);

    const getPreferredTheme = () => {
        const storedTheme = getStoredTheme();
        if (storedTheme) {
            return storedTheme;
        }
        return 'auto';
    };

    const setTheme = theme => {
        const newTheme = theme === 'auto' ? (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light') : theme;
        $('html').attr('data-bs-theme', newTheme);
    };

    const showActiveTheme = (theme) => {
        const $themeToggler = $('.theme-toggler');
        if (!$themeToggler.length) {
            return;
        }

        $themeToggler.find('.dropdown-item.active').removeClass('active');
        $themeToggler.find('.dropdown-item .bi-check2').addClass('d-none');

        const $activeItem = $themeToggler.find('[data-bs-theme-value="' + theme + '"]');
        $activeItem.addClass('active');
        $activeItem.find('.bi-check2').removeClass('d-none');

        const iconClass = $activeItem.find('.bi:first').attr('class').match(/bi-[^\s]+/)[0];
        $themeToggler.find('.theme-icon-active').attr('class', 'bi theme-icon-active ' + iconClass);
    };

    showActiveTheme(getPreferredTheme());

    $(window.matchMedia('(prefers-color-scheme: dark)')).on('change', () => {
        const storedTheme = getStoredTheme();
        if (storedTheme === 'auto' || !storedTheme) {
            setTheme('auto');
        }
    });

    $('.theme-toggler [data-bs-theme-value]').on('click', function() {
        const theme = $(this).data('bs-theme-value');
        setStoredTheme(theme);
        setTheme(theme);
        showActiveTheme(theme);
    });
});