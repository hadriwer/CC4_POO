###################
# Variables
###################

SRC_DIR = src
BUILD_DIR = build
MAIN_CLASS = src.Main # Class Main pour tester toutes mes fonctions
JAVA_FILES = $(wildcard $(SRC_DIR)/**/*.java $(SRC_DIR)/*.java)
CLASS_FILES = $(patsubst $(SRC_DIR)/%.java, $(BUILD_DIR)/%.class, $(JAVA_FILES))

###################
# Commandes
###################

JAVAC = javac
JAVA = java

###################
# Règles
###################

all: compile

###################
# Compilation
###################

compile: $(CLASS_FILES)

$(BUILD_DIR)/%.class: $(SRC_DIR)/%.java	
	@mkdir -p $(dir $@)
	$(JAVAC) -d $(BUILD_DIR) $<

###################
# Exécution
###################

run: compile
	@echo J\'exécute la class Main...
	@echo \=\>
	@$(JAVA) -cp $(BUILD_DIR) $(MAIN_CLASS)

###################
# Nettoyage
###################

clean:
	@rm -rf $(BUILD_DIR)/*

.PHONY: all compile run clean
