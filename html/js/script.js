let menuVisible = false;
let selectedLocation = null;

$(document).ready(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type === 'toggleMenu') {
            $('#teleport-menu').toggleClass('hidden');
            if (!$('#teleport-menu').hasClass('hidden')) {
                renderLocations(event.data.locations);
                $('#location-search').focus();
            }
        }
    });

    $('#location-search').on('input', function() {
        const searchTerm = $(this).val().toLowerCase();
        $('.location-item').each(function() {
            const locationText = $(this).find('.location-name').text().toLowerCase() + 
                               $(this).find('.location-desc').text().toLowerCase();
            $(this).toggle(locationText.includes(searchTerm));
        });
    });

    $('.location-item').click(function() {
        selectedLocation = {
            x: parseFloat($(this).data('x')),
            y: parseFloat($(this).data('y')),
            z: parseFloat($(this).data('z')),
            name: $(this).find('.location-name').text(),
            desc: $(this).find('.location-desc').text(),
            icon: $(this).find('i').attr('class')
        };
        
        showPreview(selectedLocation);
    });

    $('#cancel-teleport').click(function() {
        $('#preview-modal').addClass('hidden');
    });

    $('#confirm-teleport').click(function() {
        if (selectedLocation) {
            $.post('https://dxn-tpmenu/teleport', JSON.stringify({
                x: selectedLocation.x,
                y: selectedLocation.y,
                z: selectedLocation.z
            }));
            closeMenu();
        }
    });

    $('#close-menu').click(closeMenu);

    $(document).keyup(function(e) {
        if (e.key === "Escape") {
            if (!$('#preview-modal').hasClass('hidden')) {
                $('#preview-modal').addClass('hidden');
            } else if (!$('#teleport-menu').hasClass('hidden')) {
                closeMenu();
            }
        }
    });
});

function showPreview(location) {
    $('#preview-icon').attr('class', location.icon);
    $('#preview-name').text(location.name);
    $('#preview-desc').text(location.desc);
    $('#preview-x').text(location.x.toFixed(2));
    $('#preview-y').text(location.y.toFixed(2));
    $('#preview-z').text(location.z.toFixed(2));
    $('#preview-modal').removeClass('hidden');
}

function closeMenu() {
    $('#teleport-menu').addClass('hidden');
    $('#preview-modal').addClass('hidden');
    $.post('https://dxn-tpmenu/closeMenu', JSON.stringify({}));
}

function renderLocations(categories) {
    const locationList = $('.location-list');
    locationList.empty();
    
    categories.forEach(category => {
        const categoryHtml = `
            <div class="location-category">
                <h3>${category.name}</h3>
                ${category.locations.map(location => `
                    <div class="location-item" 
                         data-x="${location.coords.x}" 
                         data-y="${location.coords.y}" 
                         data-z="${location.coords.z}">
                        <i class="fas ${location.icon}"></i>
                        <div class="location-info">
                            <span class="location-name">${location.name}</span>
                            <span class="location-desc">${location.desc}</span>
                        </div>
                    </div>
                `).join('')}
            </div>
        `;
        locationList.append(categoryHtml);
    });
    

    $('.location-item').click(function() {
        selectedLocation = {
            x: parseFloat($(this).data('x')),
            y: parseFloat($(this).data('y')),
            z: parseFloat($(this).data('z')),
            name: $(this).find('.location-name').text(),
            desc: $(this).find('.location-desc').text(),
            icon: $(this).find('i').attr('class')
        };
        showPreview(selectedLocation);
    });
}
