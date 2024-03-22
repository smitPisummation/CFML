function  fun_next_page() {
    let page = document.querySelector("input[name=page]").value;

    document.querySelector("input[name=page]").value = page++;
    window.location.href = `${location.origin}/${location.pathname}?page=${page}`;
}

function  fun_previous_page() {
    let page = document.querySelector("input[name=page]").value;

    document.querySelector("input[name=page]").value = page--;
    window.location.href = `${location.origin}/${location.pathname}?page=${page}`;
}                
        
function isBlank(obj, message = 'Field must contain string!') {
    const value = obj.value;
    if (value === "") {
        alert(message);
        obj.value = "";
        obj.focus();
        return false;
    }
    return true;
}

function isEmail(obj, message = 'Field must contain string!') {
    const value = obj.value.trim();
    const email = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    if (!value.match(email)) {
        alert(message);
        obj.value = "";
        obj.focus();
        return false;
    }
    return true;
}

function isPhone(obj, message = 'Field must contain string!') {
    const value = obj.value.trim();
    const phone = /^(\+\d{1,3}[- ]?)?\d{10}$/;

    if (!value.match(phone)) {
        alert(message);
        obj.value = "";
        obj.focus();
        return false;
    }
    return true;
}

function addOtherField(obj) {
    const otherText = document.getElementById("otherContact");
    otherText.style.display = "none";

    if (obj.checked === true) {
        otherText.style.display = "block";
    }
}
function addOtherFieldBootStrap(obj) {
    const otherText = document.getElementById("otherContact");
    otherText.className = "d-none";
    // console.log(otherText);
    if (obj.checked) {
        otherText.className = "d-block";
    }
}

function checkOther(obj) {
    other = document.getElementById("otherOpt");
    // console.log(other)
    other.style.display = "none";
    if (obj.value === "4") {
        other.style.display = "block";
    }
}
function checkOtherBootStrap(obj) {
    other = document.getElementById("otherOpt");
    console.log(other)
    other.className = "d-none";
    if (obj.value === "other") {
        other.className = "d-block";
    }
}

let count = 1;
function addDates() {
    const div = document.getElementById("date");

    const input = document.createElement("input");
    input.setAttribute("type", "text");
    input.setAttribute("class", "dates");
    // input.setAttribute("name", "date");
    input.setAttribute("placeholder", "31-12-2024");
    div.append(input);
    count += 1;
}

function checkDates(obj, message = 'Field must contain string!') {
    const div = document.getElementById("date");
    const divChild = div.children;
    console.log(divChild[1])

    for (let i = 0; i < divChild.length; i++) {
        if (!isBlank(divChild[i], 'feel date field', i)) {
            return false;
        }
    }
    return true;
}

function isChecked(obj, message = "Fill contact details") {
    const obj1 = Array.from(obj).some(ele => ele.checked);
    if (!obj1) {
        alert(message);
        obj[0].focus();
        return false;
    }
    return true;
}
