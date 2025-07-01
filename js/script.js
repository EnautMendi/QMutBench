// --- Global Data Variables ---
let allFilesData = []; 
let allMutantsData = []; 

// --- References to HTML Elements ---
const genericSection = document.getElementById('generic-section');
const characteristicsToAvoidSection = document.getElementById('characteristics-to-avoid-section');
const resultsSection = document.getElementById('results-section');

let programOriginCheckboxes; 
let toggleAllProgramOrigins;

const minQubitDropdown = document.getElementById('min-qubit');
const maxQubitDropdown = document.getElementById('max-qubit');

const survivalRateCheckboxes = document.querySelectorAll('#survival-rate-checkboxes input[type="checkbox"][name="survival-rate"]');
const toggleAllSurvivalRates = document.querySelector('#survival-rate-checkboxes .toggle-all-checkbox');


const quantumGatesCheckboxes = document.querySelectorAll('#quantum-gates-checkboxes input[type="checkbox"][name="quantum-gate"]');
const toggleAllQuantumGates = document.querySelector('#quantum-gates-checkboxes .toggle-all-checkbox');

const positionsCheckboxes = document.querySelectorAll('#positions-checkboxes input[type="checkbox"][name="position"]');
const toggleAllPositions = document.querySelector('#positions-checkboxes .toggle-all-checkbox'); // Corrected ID to match HTML

const mutationOperatorsCheckboxes = document.querySelectorAll('#mutation-operators-checkboxes input[type="checkbox"][name="mutation-operator"]');
const toggleAllMutationOperators = document.querySelector('#mutation-operators-checkboxes .toggle-all-checkbox');

const fileListContainer = document.getElementById('file-list');
let toggleAllFilesCheckbox = document.getElementById('toggle-all-files'); 
const downloadButton = document.getElementById('download-selected-btn');
// const selectedCountSpan = document.getElementById('selected-count');

const programOriginData = {
    "no": {
        "dj": [{ value: "dj", label: "dj" }],
        "ghz": [{ value: "ghz", label: "ghz" }],
        "graphstate": [{ value: "graphstate", label: "graphstate" }],
        "qft": [{ value: "qft", label: "qft" }, { value: "qftentangled", label: "qftentangled" }],
        "qgan": [{ value: "qgan", label: "qgan" }],
        "qwalk": [{ value: "qwalk-noancilla", label: "qwalk-noancilla" }, { value: "qwalk-v-chain", label: "qwalk-v-chain" }],
        "wstate": [{ value: "wstate", label: "wstate" }]
    },
    "yes": {
        "ae": [{ value: "ae", label: "ae" }, { value: "pricingcall", label: "pricingcall" }, { value: "pricingput", label: "pricingput" }],
        "grover": [{ value: "grover-noancilla", label: "grover-noancilla" }, { value: "grover-v-chain", label: "grover-v-chain" }],
        "qaoa": [{ value: "portfolioqaoa", label: "portfolioqaoa" }, { value: "qaoa", label: "qaoa" }],
        "qpe": [{ value: "qpeexact", label: "qpeexact" }, { value: "qpeinexact", label: "qpeinexact" }],
        "vqe": [
            { value: "groundstatelarge", label: "groundstatelarge" },
            { value: "groundstatemedium", label: "groundstatemedium" },
            { value: "groundstatesmall", label: "groundstatesmall" },
            { value: "portfoliovqe", label: "portfoliovqe" },
            { value: "realamprandom", label: "realamprandom" },
            { value: "routing", label: "routing" },
            { value: "su2random", label: "su2random" },
            { value: "tsp", label: "tsp" },
            { value: "twolocalrandom", label: "twolocalrandom" },
            { value: "vqe", label: "vqe" }
        ]
    }
};

// --- Functions for Progressive Unlocking ---
function hasSelection(sectionElement) {
    const selects = sectionElement.querySelectorAll('select');
    for (let select of selects) {
        if (select.value && select.value !== '') {
            return true;
        }
    }
    const checkboxes = sectionElement.querySelectorAll('input[type="checkbox"]:not(.toggle-all-checkbox)');
    for (let checkbox of checkboxes) {
        if (checkbox.checked) {
            return true;
        }
    }
    return false;
}

function updateSectionStates() {
    genericSection.classList.remove('locked-section'); 
    const programOriginHasSelection = hasSelection(document.getElementById('program-origin-checkboxes'));
    const survivalRateHasSelection = hasSelection(document.getElementById('survival-rate-checkboxes'));


    const qubitRangeHasSelection = true;


    
    if (programOriginHasSelection && survivalRateHasSelection && qubitRangeHasSelection) {
        characteristicsToAvoidSection.classList.remove('locked-section');
        if (resultsSection.classList.contains('locked-section')) {
            resultsSection.classList.remove('locked-section');
            filterAndRenderFiles(); 
        } else {
            filterAndRenderFiles(); 
        }
    } else {
        characteristicsToAvoidSection.classList.add('locked-section');
        resultsSection.classList.add('locked-section');
        renderFiles([]);
    }
}

// --- Functions for "Select All" Checkbox Toggles ---
/**
 * Sets up a "Select All" toggle for a given checkbox group.
 * @param {HTMLInputElement} toggleCheckboxElement The "Select All/None" checkbox element itself (the <input type="checkbox">).
 * @param {NodeList} targetCheckboxes A NodeList of the checkboxes to be toggled by this control.
 * @param {boolean} isFileListToggle Optional. Set to true if this is for the main file list checkboxes.
 */
function setupToggleAllNone(toggleCheckboxElement, targetCheckboxes, isFileListToggle = false) {
    if (!toggleCheckboxElement || !targetCheckboxes) {
        console.warn("setupToggleAllNone: Missing toggleCheckboxElement or targetCheckboxes.", { toggleCheckboxElement, targetCheckboxes });
        return;
    }

    if (targetCheckboxes.length === 0) {
        toggleCheckboxElement.disabled = true;
        toggleCheckboxElement.checked = false;
        toggleCheckboxElement.indeterminate = false;
        return;
    } else {
        toggleCheckboxElement.disabled = false;
    }

    const newToggleCheckboxElement = toggleCheckboxElement.cloneNode(true);
    if (toggleCheckboxElement.parentNode) {
        toggleCheckboxElement.parentNode.replaceChild(newToggleCheckboxElement, toggleCheckboxElement);
    }
    if (isFileListToggle) {
        toggleAllFilesCheckbox = newToggleCheckboxElement;
    }
    toggleCheckboxElement = newToggleCheckboxElement;


    toggleCheckboxElement.addEventListener('change', () => {
        const isChecked = toggleCheckboxElement.checked;
        targetCheckboxes.forEach(checkbox => {
            checkbox.checked = isChecked;
        });
        if (isFileListToggle) {
            updateSelectedCount();
        } else {
            const parentSection = toggleCheckboxElement.closest('label')?.closest('section');
            if (parentSection) {
                parentSection.dispatchEvent(new Event('change', { bubbles: true }));
            }
        }
    });

    targetCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', () => {
            const allChecked = Array.from(targetCheckboxes).every(cb => cb.checked);
            const anyChecked = Array.from(targetCheckboxes).some(cb => cb.checked);

            if (allChecked && targetCheckboxes.length > 0) { 
                toggleCheckboxElement.checked = true;
                toggleCheckboxElement.indeterminate = false;
            } else if (anyChecked) {
                toggleCheckboxElement.checked = false;
                toggleCheckboxElement.indeterminate = true;
            } else {
                toggleCheckboxElement.checked = false;
                toggleCheckboxElement.indeterminate = false;
            }
            if (isFileListToggle) {
                updateSelectedCount();
            } else {
                const parentSection = toggleCheckboxElement.closest('label')?.closest('section');
                if (parentSection) {
                    parentSection.dispatchEvent(new Event('change', { bubbles: true }));
                }
            }
        });
    });

    const initialAllChecked = Array.from(targetCheckboxes).every(cb => cb.checked);
    const initialAnyChecked = Array.from(targetCheckboxes).some(cb => cb.checked);
    if (initialAllChecked && targetCheckboxes.length > 0) { 
        toggleCheckboxElement.checked = true;
        toggleCheckboxElement.indeterminate = false;
    } else if (initialAnyChecked) {
        toggleCheckboxElement.checked = false;
        toggleCheckboxElement.indeterminate = true;
    } else {
        toggleCheckboxElement.checked = false;
        toggleCheckboxElement.indeterminate = false;
    }
}


// --- Dynamic Checkbox Generation for Program Origins ---
function renderProgramOriginCheckboxes() {
    const programOriginCheckboxContainer = document.getElementById('program-origin-checkboxes');
    if (!programOriginCheckboxContainer) return;

    let htmlContent = `
        <label class="select-all-toggle"><input type="checkbox" class="toggle-all-checkbox" id="toggle-all-program-origins"> Select All/None Programs</label>
        <hr class="toggle-separator">
        <div class="output-type-columns">
            <div class="output-type-column">
                <label class="select-all-toggle output-type-toggle"><input type="checkbox" class="toggle-all-checkbox" data-output-type="yes"> Dominant Output</label>
                <hr class="column-separator">
                <div class="algorithm-groups" id="dominant-output-groups"></div>
            </div>
            <div class="output-type-column">
                <label class="select-all-toggle output-type-toggle"><input type="checkbox" class="toggle-all-checkbox" data-output-type="no"> Non-Dominant Output</label>
                <hr class="column-separator">
                <div class="algorithm-groups" id="non-dominant-output-groups"></div>
            </div>
        </div>
    `;
    programOriginCheckboxContainer.innerHTML = htmlContent;

    const dominantOutputGroupsDiv = document.getElementById('dominant-output-groups');
    const nonDominantOutputGroupsDiv = document.getElementById('non-dominant-output-groups');

    function createAlgorithmGroupHTML(outputType, algorithmGroupData) {
        let groupHtml = '';
        for (const algoGroupName in algorithmGroupData) {
            if (algorithmGroupData.hasOwnProperty(algoGroupName)) {
                const programs = algorithmGroupData[algoGroupName];
                const cleanAlgoGroupName = algoGroupName.replace(/\s/g, '-');
                groupHtml += `
                    <div class="algorithm-group">
                        <label class="select-all-toggle algorithm-group-toggle"><input type="checkbox" class="toggle-all-checkbox" id="toggle-algo-group-${outputType}-${cleanAlgoGroupName}" data-output-type="${outputType}" data-algorithm-group="${cleanAlgoGroupName}"> ${algoGroupName.toUpperCase()}</label>
                        <hr class="group-separator">
                `;
                programs.forEach(program => {
                    groupHtml += `
                        <label><input type="checkbox" name="program-origin" value="${program.value}" data-output-type="${outputType}" data-algorithm-group="${cleanAlgoGroupName}"> ${program.label}</label>
                    `;
                });
                groupHtml += `</div>`;
            }
        }
        return groupHtml;
    }

    dominantOutputGroupsDiv.innerHTML = createAlgorithmGroupHTML('yes', programOriginData.yes);
    nonDominantOutputGroupsDiv.innerHTML = createAlgorithmGroupHTML('no', programOriginData.no);


    programOriginCheckboxes = document.querySelectorAll('#program-origin-checkboxes input[type="checkbox"][name="program-origin"]');
    toggleAllProgramOrigins = document.getElementById('toggle-all-program-origins');

    console.log("Setting up main program origin toggle:", toggleAllProgramOrigins);
    console.log("Targeting programs:", programOriginCheckboxes);

    setupToggleAllNone(toggleAllProgramOrigins, programOriginCheckboxes, false);

    document.querySelectorAll('.output-type-toggle input.toggle-all-checkbox').forEach(outputToggleInput => {
        const outputType = outputToggleInput.dataset.outputType; 
        const targetCheckboxes = document.querySelectorAll(`input[name="program-origin"][data-output-type="${outputType}"]`);
        console.log(`Setting up output type toggle (${outputType}):`, outputToggleInput, "targeting:", targetCheckboxes);
        setupToggleAllNone(outputToggleInput, targetCheckboxes, false); 
    });

    document.querySelectorAll('.algorithm-group-toggle input.toggle-all-checkbox').forEach(algoGroupToggleInput => {
        const outputType = algoGroupToggleInput.dataset.outputType; 
        const algorithmGroup = algoGroupToggleInput.dataset.algorithmGroup; 
        const targetCheckboxes = document.querySelectorAll(`input[name="program-origin"][data-output-type="${outputType}"][data-algorithm-group="${algorithmGroup}"]`);
        console.log(`Setting up algo group toggle (${algorithmGroup}):`, algoGroupToggleInput, "targeting:", targetCheckboxes);
        setupToggleAllNone(algoGroupToggleInput, targetCheckboxes, false);
    });
}

function populateQubitRangeDropdowns() {
    const minQubitOptions = Array.from({ length: 29 }, (_, i) => i + 2);
    const maxQubitOptions = Array.from({ length: 29 }, (_, i) => i + 2);

    minQubitDropdown.innerHTML = '<option value="">Min</option>';
    maxQubitDropdown.innerHTML = '<option value="">Max</option>';

    minQubitOptions.forEach(num => {
        const option = document.createElement('option');
        option.value = num;
        option.textContent = num;
        minQubitDropdown.appendChild(option);
    });

    maxQubitOptions.forEach(num => {
        const option = document.createElement('option');
        option.value = num;
        option.textContent = num;
        maxQubitDropdown.appendChild(option);
    });

    minQubitDropdown.addEventListener('change', updateSectionStates);
    maxQubitDropdown.addEventListener('change', updateSectionStates);

    minQubitDropdown.addEventListener('change', () => {
        const minVal = parseInt(minQubitDropdown.value);
        const maxVal = parseInt(maxQubitDropdown.value);

        if (!isNaN(minVal) && !isNaN(maxVal) && minVal > maxVal) {
            maxQubitDropdown.value = minVal;
        }
        Array.from(maxQubitDropdown.options).forEach(option => {
            if (option.value === "") return;
            const optionVal = parseInt(option.value);
            option.disabled = !isNaN(minVal) && optionVal < minVal;
        });
    });

    maxQubitDropdown.addEventListener('change', () => {
        const minVal = parseInt(minQubitDropdown.value);
        const maxVal = parseInt(maxQubitDropdown.value);

        if (!isNaN(minVal) && !isNaN(maxVal) && maxVal < minVal) {
            minQubitDropdown.value = maxVal; 
        }
        Array.from(minQubitDropdown.options).forEach(option => {
            if (option.value === "") return;
            const optionVal = parseInt(option.value);
            option.disabled = !isNaN(maxVal) && optionVal > maxVal;
        });
    });
}


// --- Filtering Logic ---
/**
 * Gathers the currently selected filter values from the UI.
 * @returns {object} An object containing the selected filters.
 */
function getSelectedFilters() {
    const filters = {
        selectedPrograms: [],
        minQubits: null,
        maxQubits: null,
        selectedSurvivalRateBins: [],

        avoidGates: [],
        avoidPositions: [],
        avoidMutationOperators: []
    };

    if (programOriginCheckboxes) {
        programOriginCheckboxes.forEach(checkbox => {
            if (checkbox.checked) {
                filters.selectedPrograms.push(checkbox.value);
            }
        });
    }

    if (minQubitDropdown.value) {
        filters.minQubits = parseInt(minQubitDropdown.value);
    }
    if (maxQubitDropdown.value) {
        filters.maxQubits = parseInt(maxQubitDropdown.value);
    }


    survivalRateCheckboxes.forEach(checkbox => {
        if (checkbox.checked) {
            const [min, max] = checkbox.value.split('-').map(Number);
            filters.selectedSurvivalRateBins.push({ min, max });
        }
    });

    quantumGatesCheckboxes.forEach(checkbox => {
        if (checkbox.checked) {
            filters.avoidGates.push(checkbox.value);
        }
    });

    positionsCheckboxes.forEach(checkbox => {
        if (checkbox.checked) {
            const [min, max] = checkbox.value.split('-').map(Number);
            filters.avoidPositions.push({ min, max });
        }
    });

    mutationOperatorsCheckboxes.forEach(checkbox => {
        if (checkbox.checked) {
            filters.avoidMutationOperators.push(checkbox.value);
        }
    });

    console.log("Current Filters:", filters);
    return filters;
}

/**
 * Filters the global allFilesData based on the current selections and renders the results.
 */
async function filterAndRenderFiles() {
    if (resultsSection.classList.contains('locked-section')) {
        renderFiles([]);
        return;
    }

    if (allFilesData.length === 0) {
        console.warn("CSV data (grouped_data_SR.csv) not yet loaded. Skipping filter and render.");
        renderFiles([]); 
        return;
    }

    const filters = getSelectedFilters();
    let filteredData = [...allFilesData];

    console.log("Initial data for filtering:", filteredData.length, "rows.");

    if (filters.selectedPrograms.length > 0) {
        filteredData = filteredData.filter(file => {
            return filters.selectedPrograms.includes(file.algorithm);
        });
        console.log("After Program filtering:", filteredData.length, "rows. Selected programs:", filters.selectedPrograms);
    }

    filteredData = filteredData.filter(file => {
        let fileQubitValues;
        try {
            fileQubitValues = JSON.parse(file.qubit_values);
            if (!Array.isArray(fileQubitValues)) {
                console.warn(`qubit_values for file ${file.filename} is not an array after parsing:`, file.qubit_values);
                return false; 
            }
        } catch (e) {
            console.warn(`Error parsing qubit_values for file ${file.filename}:`, file.qubit_values, e);
            return false; 
        }

        const effectiveMin = filters.minQubits !== null ? filters.minQubits : 2; 
        const effectiveMax = filters.maxQubits !== null ? filters.maxQubits : 30;

        return fileQubitValues.some(qubitVal => {
            const numQubitVal = parseInt(qubitVal);
            if (isNaN(numQubitVal)) {
                return false; 
            }
            return numQubitVal >= effectiveMin && numQubitVal <= effectiveMax;
        });
    });
    console.log("After Qubit Range filtering:", filteredData.length, "rows. Effective Min/Max Qubits:", filters.minQubits, filters.maxQubits);


    if (filters.selectedSurvivalRateBins.length > 0) {
        filteredData = filteredData.filter(file => {
            const fileSurvivalRate = parseFloat(file.survival_rate);
            if (isNaN(fileSurvivalRate)) {
                return false;
            }

            const isInAnySelectedBin = filters.selectedSurvivalRateBins.some(bin =>
                fileSurvivalRate >= bin.min && fileSurvivalRate <= bin.max
            );
            return isInAnySelectedBin;
        });
        console.log("After Survival Rate filtering:", filteredData.length, "rows. Selected bins:", filters.selectedSurvivalRateBins);
    }


    if (filters.avoidGates.length > 0) {
        filteredData = filteredData.filter(file => {
            const fileGate = file.gate ? String(file.gate).trim() : '';
            return !filters.avoidGates.includes(fileGate);
        });
        console.log("After Avoid Gates filtering:", filteredData.length, "rows. Avoid gates:", filters.avoidGates);
    }

    if (filters.avoidPositions.length > 0) {
        filteredData = filteredData.filter(file => {
            const filePositionNum = parseInt(file.position);

            if (isNaN(filePositionNum)) {
                return false; 
            }

            const isInAnyAvoidedBin = filters.avoidPositions.some(avoidBin =>
                filePositionNum >= avoidBin.min && filePositionNum <= avoidBin.max
            );
            return !isInAnyAvoidedBin;
        });
        console.log("After Avoid Positions filtering:", filteredData.length, "rows. Avoid positions:", filters.avoidPositions);
    }

    if (filters.avoidMutationOperators.length > 0) {
        filteredData = filteredData.filter(file => {
            const fileOperation = file.operation ? String(file.operation).trim() : '';
            return !filters.avoidMutationOperators.includes(fileOperation);
        });
        console.log("After Avoid Mutation Operators filtering:", filteredData.length, "rows. Avoid operators:", filters.avoidOperators);
    }

    renderFiles(filteredData);
    console.log("Total files rendered:", filteredData.length);
}

// --- File List Selection and Download Button ---
function updateSelectedCount() {
    const selectedCheckboxes = fileListContainer.querySelectorAll('.file-select-checkbox:checked');
    const count = selectedCheckboxes.length;
    downloadButton.disabled = count === 0;

    fileListContainer.querySelectorAll('.file-row').forEach(row => {
        const checkbox = row.querySelector('.file-select-checkbox');
        if (checkbox && checkbox.checked) {
            row.classList.add('selected');
        } else {
            row.classList.remove('selected');
        }
    });

    const allVisibleFileCheckboxes = fileListContainer.querySelectorAll('.file-select-checkbox');
    const allChecked = Array.from(allVisibleFileCheckboxes).every(cb => cb.checked);
    const anyChecked = Array.from(allVisibleFileCheckboxes).some(cb => cb.checked);

    if (allVisibleFileCheckboxes.length > 0 && allChecked) { 
        toggleAllFilesCheckbox.checked = true;
        toggleAllFilesCheckbox.indeterminate = false;
    } else if (anyChecked) {
        toggleAllFilesCheckbox.checked = false;
        toggleAllFilesCheckbox.indeterminate = true;
    } else {
        toggleAllFilesCheckbox.checked = false;
        toggleAllFilesCheckbox.indeterminate = false;
    }
}

/**
 * Dynamically renders the list of files in the database-style table.
 * @param {Array} files Array of file objects to display.
 */
function renderFiles(files) {
    fileListContainer.innerHTML = '';

    if (files.length === 0) {
        document.getElementById('no-results-message').style.display = 'block';
        if (toggleAllFilesCheckbox) { 
            toggleAllFilesCheckbox.disabled = true;
            toggleAllFilesCheckbox.checked = false;
            toggleAllFilesCheckbox.indeterminate = false;
        }
    } else {
        document.getElementById('no-results-message').style.display = 'none';
    }

    files.forEach(file => {
        const fileRow = document.createElement('div');
        fileRow.classList.add('file-row');
        fileRow.classList.add('file-list-grid-columns');

        fileRow.innerHTML = `
            <div class="row-cell checkbox-cell">
                <input type="checkbox" class="file-select-checkbox" name="file-select"
                    data-algorithm="${file.algorithm || ''}"
                    data-position="${file.position || ''}"
                    data-operation="${file.operation || ''}"
                    data-gate="${file.gate || ''}"
                    data-survival-rate="${file.survival_rate || ''}">
            </div>
            <div class="row-cell">${file.algorithm || 'N/A'}</div>
            <div class="row-cell">${file.position || 'N/A'}</div>
            <div class="row-cell">${file.operation || 'N/A'}</div>
            <div class="row-cell">${file.gate || 'N/A'}</div>
            <div class="row-cell">${file.survival_rate || 'N/A'}</div>
        `;
        fileListContainer.appendChild(fileRow);
    });

    toggleAllFilesCheckbox = document.getElementById('toggle-all-files');
    const newFileCheckboxes = fileListContainer.querySelectorAll('.file-select-checkbox');
    setupToggleAllNone(toggleAllFilesCheckbox, newFileCheckboxes, true);
    updateSelectedCount();
}

/**
 * Loads a CSV file and stores its data in a global variable.
 * @param {string} csvFilePath The path to the CSV file.
 * @param {Array<Object>} dataArray The global array to store the parsed data.
 * @param {string} dataName A name for console logging (e.g., "grouped_data_SR.csv" or "all_data.csv").
 * @param {function} [callback] An optional callback function to run after data is loaded.
 */
function loadCsvFile(csvFilePath, dataArray, dataName, callback = () => {}) {
    Papa.parse(csvFilePath, {
        download: true,
        header: true,
        skipEmptyLines: true,
        dynamicTyping: true,
        complete: function(results) {
            if (results.errors.length) {
                console.error(`Error parsing ${dataName}:`, results.errors);
                if (dataArray === allFilesData) {
                    document.getElementById('no-results-message').textContent = `Error loading ${dataName}. Please check console.`;
                    document.getElementById('no-results-message').style.display = 'block';
                }
                dataArray.length = 0; 
            } else {
                dataArray.length = 0;

                results.data.forEach(row => {
                    if (row.algorithm && String(row.algorithm).trim() !== '') {
                        dataArray.push(row);
                    }
                });
                console.log(`${dataName} loaded successfully. Total rows:`, dataArray.length);
            }
            callback();
        }
    });
}

document.addEventListener('DOMContentLoaded', async () => {
    renderProgramOriginCheckboxes();
    populateQubitRangeDropdowns();

    characteristicsToAvoidSection.classList.add('locked-section');
    resultsSection.classList.add('locked-section');

    setupToggleAllNone(toggleAllSurvivalRates, survivalRateCheckboxes, false);
    setupToggleAllNone(toggleAllQuantumGates, quantumGatesCheckboxes, false);
    setupToggleAllNone(toggleAllPositions, positionsCheckboxes, false);
    setupToggleAllNone(toggleAllMutationOperators, mutationOperatorsCheckboxes, false);

    genericSection.addEventListener('change', updateSectionStates);
    characteristicsToAvoidSection.addEventListener('change', updateSectionStates);

    console.log("Attempting to load all CSV data...");

    const loadMainCsvPromise = new Promise(resolve => {
        loadCsvFile('data/grouped_data_SR.csv', allFilesData, 'grouped_data_SR.csv', resolve);
    });
    const loadMutantsCsvPromise = new Promise(resolve => {
        loadCsvFile('data/all_data.csv', allMutantsData, 'all_data.csv', resolve);
    });

    await Promise.all([loadMainCsvPromise, loadMutantsCsvPromise]);
    console.log("All CSV data loaded. Initializing application state.");
    downloadButton.addEventListener('click', downloadSelectedFiles);

    updateSectionStates();
});
async function downloadSelectedFiles() {
    downloadButton.disabled = true; 
    downloadButton.textContent = 'Preparing Download...'; 

    const selectedCheckboxes = fileListContainer.querySelectorAll('.file-select-checkbox:checked');
    if (selectedCheckboxes.length === 0) {
        alert('Please select at least one file to download.');
        downloadButton.disabled = false;
        downloadButton.textContent = 'Download Selected Files';
        return;
    }

    const zip = new JSZip();
    const mutantCombinations = new Set(); 
    const originalProgramKeys = new Set();
	
    selectedCheckboxes.forEach(checkbox => {
        const algo = checkbox.dataset.algorithm;
        const gate = checkbox.dataset.gate;
        const position = checkbox.dataset.position;
        const operation = checkbox.dataset.operation;
        mutantCombinations.add(`${algo}|${gate}|${position}|${operation}`);
    });

    console.log("Mutant Combinations from selected files:", Array.from(mutantCombinations));

    let filesToFetch = []; 
	
    allMutantsData.forEach(row => {
        const algo = row.algorithm ? String(row.algorithm).trim() : '';
        const gate = row.gate ? String(row.gate).trim() : '';
        const position = row.position ? String(row.position).trim() : '';
        const operation = row.operation ? String(row.operation).trim() : '';

        const currentMutantCombination = `${algo}|${gate}|${position}|${operation}`;

        if (mutantCombinations.has(currentMutantCombination)) {
            const qubits = row.qubits; 
            const positionInt = row.Position_int; 

            if (qubits === undefined || positionInt === undefined) {
                console.warn(`Skipping mutant file generation for combination ${currentMutantCombination}: 'qubits' or 'Position_int' missing in allMutantsData row.`, row);
            } else {
				if (operation === "Replace") {
					const mutantFilePath = `Mutated_programs/Mutants_${algo}_${qubits}_qubits/${operation}Gate_${gate}_inPositionOfGate_${positionInt}.qasm`;
				} else if (operation === "Remove") {
					const mutantFilePath = `Mutated_programs/Mutants_${algo}_${qubits}_qubits/${operation}Gate_${positionInt}.qasm`;
				} else {
					const mutantFilePath = `Mutated_programs/Mutants_${algo}_${qubits}_qubits/${operation}Gate_${gate}_inGap_${positionInt}_.qasm`;
				}
                filesToFetch.push(mutantFilePath);
            }

            if (qubits !== undefined) {
                const originalProgramFilename = `${algo}_${qubits}_qubits.qasm`;
                const originalProgramKey = `${algo}|${qubits}`;
                if (!originalProgramKeys.has(originalProgramKey)) {
                    const originalFilePath = `Origin_programs/${originalProgramFilename}`; 
                    filesToFetch.push(originalFilePath);
                    originalProgramKeys.add(originalProgramKey);
                }
            } else {
                console.warn(`Skipping original program generation for combination ${currentMutantCombination}: 'qubits' missing in allMutantsData row.`, row);
            }
        }
    });

    console.log("Files identified for download (mutants and originals):", filesToFetch);

    if (filesToFetch.length === 0) {
        alert('No corresponding mutant or original files found for the selected characteristics.');
        downloadButton.disabled = false;
        downloadButton.textContent = 'Download Selected Files';
        return;
    }

    let downloadedCount = 0;
    for (const filePath of filesToFetch) {
        try {
            const fileUrl = `data/${filePath}`;
            const response = await fetch(fileUrl);

            if (!response.ok) {
                console.warn(`Failed to fetch ${fileUrl}: ${response.status} ${response.statusText}`);
                continue; 
            }

            const fileBlob = await response.blob();
            zip.file(filePath, fileBlob);
            downloadedCount++;
            downloadButton.textContent = `Downloading (${downloadedCount}/${filesToFetch.length})...`;
        } catch (error) {
            console.error(`Error fetching or adding file ${filePath} to zip:`, error);
        }
    }

    if (downloadedCount === 0) {
        alert('No files were successfully downloaded. Please check console for errors.');
        downloadButton.disabled = false;
        downloadButton.textContent = 'Download Selected Files';
        return;
    }

    try {
        const content = await zip.generateAsync({ type: "blob" });
        saveAs(content, "selected_quantum_programs.zip"); 
        alert(`Successfully downloaded ${downloadedCount} file(s) in "selected_quantum_programs.zip".`);
    } catch (error) {
        console.error("Error generating or saving zip:", error);
        alert('An error occurred while zipping or saving files. Please try again.');
    } finally {
        downloadButton.disabled = false;
        downloadButton.textContent = 'Download Selected Files';
    }
}
