var input = document.getElementById("input");
var initLabel = document.getElementById("dropLabel");

input.addEventListener("change", (event) => {
  const files = changeEvent(event);
  // handleUpdate(files);
  previewImage(files)
});

initLabel.addEventListener("mouseover", (event) => {
  event.preventDefault();
  const label = document.getElementById("dropLabel");
  label?.classList.add("dropLabel--hover");
});

initLabel.addEventListener("mouseout", (event) => {
  event.preventDefault();
  const label = document.getElementById("dropLabel");
  label?.classList.remove("dropLabel--hover");
});

document.addEventListener("dragenter", (event) => {
  event.preventDefault();
  console.log("dragenter");
  if (event.target.className === "indiv") {
    event.target.style.background = "#616161";
  }
});

document.addEventListener("dragover", (event) => {
  console.log("dragover");
  event.preventDefault();
});

document.addEventListener("dragleave", (event) => {
  event.preventDefault();
  console.log("dragleave");
  if (event.target.className === "indiv") {
    event.target.style.background = "#3a3a3a";
  }
});

document.addEventListener("drop", (event) => {
  event.preventDefault();
  console.log("drop");
  if (event.target.className === "indiv")
  {
    const files = event.dataTransfer?.files;
    event.target.style.background = "#3a3a3a";
    handleUpdate([...files]);
  }
});

function changeEvent(event){
  const { target } = event;
  return [...target.files];
};

function handleUpdate(fileList){
  const preview = document.getElementById("preview");

  fileList.forEach((file) => {
    const reader = new FileReader();
    reader.addEventListener("load", (event) => {
      const img = el("img", {
        className: "embed-img",
        src: event.target?.result,
      });
      const imgdropbox = el("div", { className: "dropbox-img" }, img);
      preview.append(imgdropbox);
    });
    reader.readAsDataURL(file);
  });
};

function el(nodeName, attributes, ...children) {
  const node =
    nodeName === "fragment"
      ? document.createDocumentFragment()
      : document.createElement(nodeName);

  Object.entries(attributes).forEach(([key, value]) => {
    if (key === "events") {
      Object.entries(value).forEach(([type, listener]) => {
        node.addEventListener(type, listener);
      });
    } else if (key in node) {
      try {
        node[key] = value;
      } catch (err) {
        node.setAttribute(key, value);
      }
    } else {
      node.setAttribute(key, value);
    }
  });

  children.forEach((childNode) => {
    if (typeof childNode === "string") {
      node.appendChild(document.createTextNode(childNode));
    } else {
      node.appendChild(childNode);
    }
  });

  return node;
}


function previewImage(f){

  
  var file = f.files;
  // 확장자 체크
  if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
      alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);
      // 선택한 파일 초기화
      f.outerHTML = f.outerHTML;
      document.getElementById('preview').innerHTML = '';
  }
  else {
      // FileReader 객체 사용
      var reader = new FileReader();
      // 파일 읽기가 완료되었을때 실행
      reader.onload = function(rst){
          document.querySelector('#preview>img').remove()
          document.getElementById('preview').innerHTML = '<img style="width: 500px; height: 800px" src="' + rst.target.result + '">';
          console.log(rst.target.result)
      }
      // 파일을 읽는다
      reader.readAsDataURL(file[0]);
      console.log(file[0].name)
      document.getElementById('fileName').innerHTML = file[0].name;
  }
  }