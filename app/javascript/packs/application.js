import "bootstrap";

const input = document.getElementById("booking_end_date");
input.addEventListener("change", (event) => {
  const endDate = event.currentTarget.value;
  const startDate = document.getElementById("booking_start_date").value;
  const timeDiff = Math.abs(new Date(endDate).getTime() - new Date(startDate).getTime());
  const diffDays = Math.abs(timeDiff / (1000 * 3600 * 24));
  const pricePerNight = parseInt(document.querySelector(".price-tag").dataset.rate, 10);
  const fullPrice = diffDays * pricePerNight;
  const priceH2 = document.querySelector(".full-price");
  priceH2.innerText = `Your total is £${fullPrice}`;
  if (priceH2.classList.contains("d-none")) {
    priceH2.classList.remove("d-none");
  }
})
